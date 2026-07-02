import SwiftUI

enum _XGm0251Bl: String, Hashable, CaseIterable {
    case _xPm0230, _xPm0231
    var _xGm0252: String { self == ._xPm0230 ? "Guess the artist" : "Guess the title" }
    var _xGm0253: String { self == ._xPm0230 ? "Who made this work?" : "What is this work called?" }
}

struct _XGm0250Bl: Hashable {
    let _xGm0254: String
    let _xGm0255: String
    let _xGm0256: Int
    let _xGm0257: _XGm0251Bl
}

@MainActor
final class _XGm0220Bl: ObservableObject {
    struct _XGm0221Bl: Identifiable {
        let id = UUID()
        let _xGm0230: _XGm0006Bl
        let _xGm0231: [String]
        let _xGm0232: Int
    }
    enum _XGm0222Bl {
        case _xPm0220, _xPm0221, _xPm0222([_XGm0221Bl]), _xPm0223(String)
    }

    @Published private(set) var _xGm0233: _XGm0222Bl = ._xPm0220
    @Published private(set) var _xGm0234 = 0
    @Published private(set) var _xGm0235 = 0
    @Published var _xGm0236: Int?
    @Published private(set) var _xGm0237 = false

    private let _xGm0005: _XGm0008Bl
    private let _xGm0258: _XGm0250Bl
    init(art: _XGm0008Bl, config: _XGm0250Bl) { self._xGm0005 = art; self._xGm0258 = config }

    private func _xGm0259(_ w: _XGm0006Bl) -> String {
        _xGm0258._xGm0257 == ._xPm0230 ? w._xGm0026 : w._xGm0017
    }

    func _xGm0238() {
        _xGm0233 = ._xPm0221
        _xGm0234 = 0; _xGm0235 = 0; _xGm0236 = nil; _xGm0237 = false
        Task {
            var pool = (try? await _xGm0005._xGm0057(_xGm0258._xGm0255)) ?? []
            if pool.count < _xGm0258._xGm0256 + 4 {
                pool += (try? await _xGm0005._xGm0058()) ?? []
            }
            let named = pool.filter {
                $0._xGm0025() != nil &&
                (_xGm0258._xGm0257 == ._xPm0231 || ($0._xGm0018?.isEmpty == false && $0._xGm0026 != "Unknown artist"))
            }
            let values = Array(Set(named.map(_xGm0259)))
            guard values.count >= 4, named.count >= 3 else {
                _xGm0233 = ._xPm0223("Couldn't gather enough works for this quiz. Try another topic."); return
            }

            var used = Set<Int>()
            var seenValue = Set<String>()
            var questions: [_XGm0221Bl] = []
            for w in named.shuffled() where questions.count < _xGm0258._xGm0256 {
                let correct = _xGm0259(w)
                guard !used.contains(w._xGm0016), !seenValue.contains(correct) else { continue }
                used.insert(w._xGm0016); seenValue.insert(correct)
                var opts = [correct]
                for v in values.shuffled() where opts.count < 4 { if v != correct && !opts.contains(v) { opts.append(v) } }
                opts.shuffle()
                questions.append(.init(_xGm0230: w, _xGm0231: opts, _xGm0232: opts.firstIndex(of: correct) ?? 0))
            }
            _xGm0233 = questions.count >= 3 ? ._xPm0222(questions) : ._xPm0223("Couldn't gather enough works for this quiz. Try another topic.")
        }
    }

    func _xGm0239(_ i: Int, _ q: _XGm0221Bl) {
        guard _xGm0236 == nil else { return }
        _xGm0236 = i
        if i == q._xGm0232 { _xGm0235 += 1 }
    }

    func _xGm0240(total: Int) {
        _xGm0236 = nil
        if _xGm0234 + 1 >= total { _xGm0237 = true } else { _xGm0234 += 1 }
    }
}

// MARK: - Hub

struct _XGm0260Bl: View {
    let _xGm0005: _XGm0008Bl
    @State private var _xGm0270 = false

    private let _xGm0271: [(String, String)] = [
        ("Old Masters", "painting"), ("Impressionists", "impressionism"),
        ("Portraits", "portrait"), ("Landscapes", "landscape"),
        ("Sculpture", "sculpture"), ("Modern Art", "modern art"),
        ("Asian Art", "asian art"), ("Ancient World", "ancient")
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 22) {
                _xGm0272
                Button { _xGm0270 = true } label: {
                    HStack {
                        Image(systemName: "plus.circle")
                        Text("Create your own quiz")
                    }
                }.buttonStyle(_XGm0035Bl(_xGm0113: true))

                Text("PICK A COLLECTION").font(_XGm0033Bl._xGm0008(11)).tracking(2).foregroundStyle(_XGm0032Bl._xGm0107)
                VStack(spacing: 12) {
                    ForEach(Array(_xGm0271.enumerated()), id: \.offset) { _, c in
                        NavigationLink(value: _XGm0250Bl(_xGm0254: c.0, _xGm0255: c.1, _xGm0256: 10, _xGm0257: ._xPm0230)) {
                            _xGm0273(c.0, "Guess the artist · 10 questions")
                        }.buttonStyle(.plain)
                    }
                    NavigationLink(value: _XGm0250Bl(_xGm0254: "Name That Piece", _xGm0255: "painting", _xGm0256: 10, _xGm0257: ._xPm0231)) {
                        _xGm0273("Name That Piece", "Guess the title · 10 questions")
                    }.buttonStyle(.plain)
                }
            }
            .padding(24)
        }
        .background(_XGm0032Bl._xGm0103.ignoresSafeArea())
        .navigationTitle("Quizzes")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: _XGm0250Bl.self) { _XGm0223Bl(art: _xGm0005, config: $0) }
        .sheet(isPresented: $_xGm0270) {
            _XGm0261Bl(_xGm0005: _xGm0005)
        }
    }

    private var _xGm0272: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Test your eye").font(_XGm0033Bl._xGm0112(30)).foregroundStyle(_XGm0032Bl._xGm0106)
            Text("Play a ready-made round or build your own from any topic.")
                .font(_XGm0033Bl._xGm0027(14)).foregroundStyle(_XGm0032Bl._xGm0107)
            Rectangle().fill(_XGm0032Bl._xGm0108).frame(width: 50, height: 2).padding(.top, 2)
        }
        .padding(.top, 6)
    }

    private func _xGm0273(_ title: String, _ subtitle: String) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title).font(_XGm0033Bl._xGm0017(18)).foregroundStyle(_XGm0032Bl._xGm0106)
                Text(subtitle).font(_XGm0033Bl._xGm0027(13)).foregroundStyle(_XGm0032Bl._xGm0107)
            }
            Spacer()
            Image(systemName: "chevron.right").font(.system(size: 13, weight: .semibold)).foregroundStyle(_XGm0032Bl._xGm0107)
        }
        .padding(16).frame(maxWidth: .infinity)
        .overlay(Rectangle().strokeBorder(_XGm0032Bl._xGm0110, lineWidth: 1))
    }
}

// MARK: - Create

struct _XGm0261Bl: View {
    let _xGm0005: _XGm0008Bl
    @Environment(\.dismiss) private var dismiss

    @State private var _xGm0274 = ""
    @State private var _xGm0275 = 10
    @State private var _xGm0276: _XGm0251Bl = ._xPm0230
    @State private var _xGm0277: _XGm0250Bl?

    private let _xGm0278 = [5, 10, 15, 20]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    _xGm0279("TOPIC")
                    TextField("", text: $_xGm0274, prompt: Text("e.g. Van Gogh, Egypt, cats…").foregroundStyle(_XGm0032Bl._xGm0109))
                        .font(_XGm0033Bl._xGm0027(16)).foregroundStyle(_XGm0032Bl._xGm0106)
                        .padding(.vertical, 10).overlay(Rectangle().fill(_XGm0032Bl._xGm0110).frame(height: 1), alignment: .bottom)

                    _xGm0279("MODE")
                    HStack(spacing: 0) {
                        ForEach(_XGm0251Bl.allCases, id: \.self) { m in
                            let on = _xGm0276 == m
                            Button { _xGm0276 = m } label: {
                                Text(m._xGm0252).font(_XGm0033Bl._xGm0008(13))
                                    .foregroundStyle(on ? _XGm0032Bl._xGm0103 : _XGm0032Bl._xGm0106)
                                    .frame(maxWidth: .infinity).frame(height: 46)
                                    .background(on ? _XGm0032Bl._xGm0106 : Color.clear)
                            }
                            if m != _XGm0251Bl.allCases.last { Rectangle().fill(_XGm0032Bl._xGm0106).frame(width: 1) }
                        }
                    }.overlay(Rectangle().strokeBorder(_XGm0032Bl._xGm0106, lineWidth: 1))

                    _xGm0279("QUESTIONS")
                    HStack(spacing: 10) {
                        ForEach(_xGm0278, id: \.self) { n in
                            let on = _xGm0275 == n
                            Button { _xGm0275 = n } label: {
                                Text("\(n)").font(_XGm0033Bl._xGm0008(15))
                                    .foregroundStyle(on ? _XGm0032Bl._xGm0103 : _XGm0032Bl._xGm0106)
                                    .frame(width: 54, height: 46)
                                    .background(on ? _XGm0032Bl._xGm0106 : Color.clear)
                                    .overlay(Rectangle().strokeBorder(_XGm0032Bl._xGm0106, lineWidth: 1))
                            }
                        }
                    }

                    NavigationLink(value: _xGm0280()) {
                        Text("Start quiz")
                    }.buttonStyle(_XGm0035Bl(_xGm0113: true))
                    .disabled(_xGm0274.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                .padding(24)
            }
            .background(_XGm0032Bl._xGm0103.ignoresSafeArea())
            .navigationTitle("New quiz")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { ToolbarItem(placement: .cancellationAction) { Button("Cancel") { dismiss() } } }
            .navigationDestination(for: _XGm0250Bl.self) { _XGm0223Bl(art: _xGm0005, config: $0) }
            .tint(_XGm0032Bl._xGm0106)
        }
    }

    private func _xGm0279(_ t: String) -> some View {
        Text(t).font(_XGm0033Bl._xGm0008(11)).tracking(1.5).foregroundStyle(_XGm0032Bl._xGm0107)
    }

    private func _xGm0280() -> _XGm0250Bl {
        let q = _xGm0274.trimmingCharacters(in: .whitespaces)
        return _XGm0250Bl(_xGm0254: q.isEmpty ? "Custom" : q.capitalized, _xGm0255: q, _xGm0256: _xGm0275, _xGm0257: _xGm0276)
    }
}

// MARK: - Play

struct _XGm0223Bl: View {
    @StateObject private var _xGm0241: _XGm0220Bl
    private let _xGm0281: _XGm0250Bl
    init(art: _XGm0008Bl, config: _XGm0250Bl) {
        _xGm0281 = config
        __xGm0241 = StateObject(wrappedValue: _XGm0220Bl(art: art, config: config))
    }

    var body: some View {
        ZStack {
            _XGm0032Bl._xGm0103.ignoresSafeArea()
            switch _xGm0241._xGm0233 {
            case ._xPm0220, ._xPm0221:
                ProgressView().tint(_XGm0032Bl._xGm0106)
            case ._xPm0223(let msg):
                _XGm0029Bl(_xGm0123: "questionmark.circle", _xGm0046: "Quiz unavailable", _xGm0124: msg)
            case ._xPm0222(let qs):
                if _xGm0241._xGm0237 { _xGm0242(qs.count) } else { _xGm0243(qs) }
            }
        }
        .navigationTitle(_xGm0281._xGm0254)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { if case ._xPm0220 = _xGm0241._xGm0233 { _xGm0241._xGm0238() } }
    }

    private func _xGm0243(_ qs: [_XGm0220Bl._XGm0221Bl]) -> some View {
        let q = qs[_xGm0241._xGm0234]
        return ScrollView {
            VStack(spacing: 20) {
                HStack {
                    Text("QUESTION \(_xGm0241._xGm0234 + 1) / \(qs.count)").font(_XGm0033Bl._xGm0008(11)).tracking(2).foregroundStyle(_XGm0032Bl._xGm0107)
                    Spacer()
                    Text("Score \(_xGm0241._xGm0235)").font(_XGm0033Bl._xGm0008(12)).foregroundStyle(_XGm0032Bl._xGm0108)
                }
                ProgressView(value: Double(_xGm0241._xGm0234 + 1), total: Double(qs.count)).tint(_XGm0032Bl._xGm0106)
                _XGm0026Bl(_xGm0010: q._xGm0230)
                    .frame(maxWidth: .infinity).frame(height: 280).clipped().background(_XGm0032Bl._xGm0105)
                    .overlay(Rectangle().strokeBorder(_XGm0032Bl._xGm0110, lineWidth: 1))
                Text(_xGm0281._xGm0257._xGm0253).font(_XGm0033Bl._xGm0017(18)).foregroundStyle(_XGm0032Bl._xGm0106)
                VStack(spacing: 10) {
                    ForEach(Array(q._xGm0231.enumerated()), id: \.offset) { i, name in
                        Button { _xGm0241._xGm0239(i, q) } label: {
                            HStack {
                                Text(name).font(_XGm0033Bl._xGm0027(15)).foregroundStyle(_xGm0244(i, q).1).multilineTextAlignment(.leading)
                                Spacer()
                                if let icon = _xGm0244(i, q).2 { Image(systemName: icon).foregroundStyle(_xGm0244(i, q).1) }
                            }
                            .padding(.horizontal, 16).padding(.vertical, 14).frame(maxWidth: .infinity, alignment: .leading)
                            .background(_xGm0244(i, q).0)
                            .overlay(Rectangle().strokeBorder(_XGm0032Bl._xGm0110, lineWidth: 1))
                        }.disabled(_xGm0241._xGm0236 != nil)
                    }
                }
                if _xGm0241._xGm0236 != nil {
                    Button { _xGm0241._xGm0240(total: qs.count) } label: {
                        Text(_xGm0241._xGm0234 + 1 >= qs.count ? "See result" : "Next")
                    }.buttonStyle(_XGm0035Bl(_xGm0113: true))
                }
            }
            .padding(24)
        }
    }

    private func _xGm0244(_ i: Int, _ q: _XGm0220Bl._XGm0221Bl) -> (Color, Color, String?) {
        guard let picked = _xGm0241._xGm0236 else { return (.clear, _XGm0032Bl._xGm0106, nil) }
        if i == q._xGm0232 { return (_XGm0032Bl._xGm0106.opacity(0.06), _XGm0032Bl._xGm0106, "checkmark") }
        if i == picked { return (_XGm0032Bl._xGm0108.opacity(0.12), _XGm0032Bl._xGm0108, "xmark") }
        return (.clear, _XGm0032Bl._xGm0107, nil)
    }

    private func _xGm0242(_ total: Int) -> some View {
        VStack(spacing: 18) {
            Spacer()
            Text("\(_xGm0241._xGm0235) / \(total)").font(_XGm0033Bl._xGm0112(56)).foregroundStyle(_XGm0032Bl._xGm0106)
            Rectangle().fill(_XGm0032Bl._xGm0108).frame(width: 50, height: 2)
            Text(_xGm0245(_xGm0241._xGm0235, total)).font(_XGm0033Bl._xGm0017(20)).foregroundStyle(_XGm0032Bl._xGm0106)
            Text("You know your galleries.").font(_XGm0033Bl._xGm0027(14)).foregroundStyle(_XGm0032Bl._xGm0107)
            Spacer()
            Button { _xGm0241._xGm0238() } label: { Text("Play again") }.buttonStyle(_XGm0035Bl(_xGm0113: true))
        }
        .padding(24)
    }

    private func _xGm0245(_ s: Int, _ t: Int) -> String {
        let r = Double(s) / Double(max(t, 1))
        switch r {
        case 1: return "Perfect eye!"
        case 0.6...: return "Well curated."
        case 0.3...: return "Keep exploring."
        default: return "Room to wander."
        }
    }
}
