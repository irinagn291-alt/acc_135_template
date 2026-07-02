import SwiftUI

@MainActor
final class _XGm0015Bl: ObservableObject {
    enum _XGm0037Bl: Equatable {
        case _xPm0011, _xPm0012([_XGm0006Bl]), _xPm0013, _xPm0014([_XGm0006Bl]), _xPm0015, _xPm0016(String)
    }
    @Published var _xGm0053 = ""
    @Published private(set) var _xGm0054: _XGm0037Bl = ._xPm0011
    @Published private(set) var _xGm0065 = 0
    let _xGm0064: [(String, String)] = [
        ("Paintings", "painting"), ("Impressionism", "impressionism"),
        ("Sculpture", "sculpture"), ("Portraits", "portrait"),
        ("Landscapes", "landscape"), ("Asian Art", "asian art"),
        ("Ancient", "ancient"), ("Modern", "modern art")
    ]
    private let _xGm0005: _XGm0008Bl
    private var _xGm0055: Task<Void, Never>?
    init(art: _XGm0008Bl) { self._xGm0005 = art }

    func _xGm0056() {
        guard case ._xPm0011 = _xGm0054 else { return }
        _xGm0067(_xGm0064[_xGm0065].1)
    }

    func _xGm0066(_ i: Int) {
        guard _xGm0064.indices.contains(i) else { return }
        _xGm0065 = i
        _xGm0053 = ""
        _xGm0067(_xGm0064[i].1)
    }

    func _xGm0068() {
        let i = (0..<_xGm0064.count).filter { $0 != _xGm0065 }.randomElement() ?? 0
        _xGm0066(i)
    }

    func _xGm0057() {
        let q = _xGm0053.trimmingCharacters(in: .whitespaces)
        guard !q.isEmpty else { _xGm0067(_xGm0064[_xGm0065].1); return }
        _xGm0067(q)
    }

    private func _xGm0067(_ q: String) {
        _xGm0055?.cancel()
        _xGm0055 = Task {
            _xGm0054 = ._xPm0013
            do {
                let w = try await _xGm0005._xGm0057(q)
                if !Task.isCancelled { _xGm0054 = w.isEmpty ? ._xPm0015 : ._xPm0012(w) }
            }
            catch is CancellationError {}
            catch _XGm0007Bl._xPm0006 { if !Task.isCancelled { _xGm0054 = ._xPm0015 } }
            catch { if !Task.isCancelled { _xGm0054 = ._xPm0016((error as? _XGm0007Bl)?.errorDescription ?? error.localizedDescription) } }
        }
    }
}

struct _XGm0016Bl: View {
    @EnvironmentObject private var _xGm0006: _XGm0031Bl
    @StateObject private var _xGm0122 = _XGm0015Bl(art: _XGm0009Bl())

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                _xGm0119
                _xGm0120
                _xGm0125
                _xGm0121
            }
            .padding(.horizontal, 24).padding(.bottom, 30)
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { _xGm0122._xGm0056() }
    }

    private var _xGm0119: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 6) {
                Text("On view").font(_XGm0033Bl._xGm0112(34)).foregroundStyle(_XGm0032Bl._xGm0106)
                Rectangle().fill(_XGm0032Bl._xGm0108).frame(width: 50, height: 2)
            }
            Spacer()
            Button { _xGm0122._xGm0068() } label: {
                Image(systemName: "shuffle").font(.system(size: 16, weight: .semibold)).foregroundStyle(_XGm0032Bl._xGm0106)
                    .frame(width: 44, height: 44).overlay(Rectangle().strokeBorder(_XGm0032Bl._xGm0106, lineWidth: 1))
            }
        }
        .padding(.top, 8)
    }

    private var _xGm0125: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(Array(_xGm0122._xGm0064.enumerated()), id: \.offset) { i, cat in
                    let on = _xGm0122._xGm0053.isEmpty && i == _xGm0122._xGm0065
                    Button { _xGm0122._xGm0066(i) } label: {
                        Text(cat.0).font(_XGm0033Bl._xGm0008(13))
                            .foregroundStyle(on ? _XGm0032Bl._xGm0103 : _XGm0032Bl._xGm0106)
                            .padding(.horizontal, 16).padding(.vertical, 9)
                            .background(on ? _XGm0032Bl._xGm0106 : Color.clear)
                            .overlay(Rectangle().strokeBorder(_XGm0032Bl._xGm0106, lineWidth: 1))
                    }
                }
            }
        }
    }

    private var _xGm0120: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass").foregroundStyle(_XGm0032Bl._xGm0107)
            TextField("", text: $_xGm0122._xGm0053, prompt: Text("Search artists, movements, works…").foregroundStyle(_XGm0032Bl._xGm0109))
                .font(_XGm0033Bl._xGm0027(15)).foregroundStyle(_XGm0032Bl._xGm0106)
                .submitLabel(.search).autocorrectionDisabled().onSubmit { _xGm0122._xGm0057() }
        }
        .padding(.vertical, 12)
        .overlay(Rectangle().fill(_XGm0032Bl._xGm0106).frame(height: 1), alignment: .bottom)
    }

    @ViewBuilder
    private var _xGm0121: some View {
        switch _xGm0122._xGm0054 {
        case ._xPm0011, ._xPm0013:
            ProgressView().tint(_XGm0032Bl._xGm0106).frame(maxWidth: .infinity).padding(.top, 60)
        case ._xPm0012(let works), ._xPm0014(let works):
            LazyVStack(spacing: 32) {
                ForEach(works) { w in
                    NavigationLink(value: _XGm0017Bl._xPm0008(w)) {
                        _XGm0028Bl(_xGm0010: w, _xGm0085: _xGm0006._xGm0097(ref: w._xGm0016) != nil)
                    }.buttonStyle(.plain)
                }
            }
            .padding(.top, 4)
        case ._xPm0015:
            _XGm0029Bl(_xGm0123: "magnifyingglass", _xGm0046: "Nothing on this wall", _xGm0124: "No works matched \"\(_xGm0122._xGm0053)\".")
        case ._xPm0016(let msg):
            _XGm0029Bl(_xGm0123: "wifi.slash", _xGm0046: "Archive unavailable", _xGm0124: msg)
        }
    }
}
