import SwiftUI

@MainActor
final class _XGm0015Bl: ObservableObject {
    enum _XGm0037Bl: Equatable {
        case _xPm0011, _xPm0012([_XGm0006Bl]), _xPm0013, _xPm0014([_XGm0006Bl]), _xPm0015, _xPm0016(String)
    }
    @Published var _xGm0053 = ""
    @Published private(set) var _xGm0054: _XGm0037Bl = ._xPm0011
    private let _xGm0005: _XGm0008Bl
    private var _xGm0055: Task<Void, Never>?
    init(art: _XGm0008Bl) { self._xGm0005 = art }

    func _xGm0056() {
        guard case ._xPm0011 = _xGm0054 else { return }
        Task {
            do { _xGm0054 = ._xPm0012(try await _xGm0005._xGm0058()) }
            catch { _xGm0054 = ._xPm0016((error as? _XGm0007Bl)?.errorDescription ?? "Unavailable") }
        }
    }

    func _xGm0057() {
        _xGm0055?.cancel()
        let q = _xGm0053.trimmingCharacters(in: .whitespaces)
        guard !q.isEmpty else { _xGm0054 = ._xPm0011; _xGm0056(); return }
        _xGm0055 = Task {
            _xGm0054 = ._xPm0013
            do {
                let w = try await _xGm0005._xGm0057(q)
                if !Task.isCancelled { _xGm0054 = w.isEmpty ? ._xPm0015 : ._xPm0014(w) }
            }
            catch is CancellationError {}
            catch _XGm0007Bl._xPm0006 { if !Task.isCancelled { _xGm0054 = ._xPm0015 } }
            catch { if !Task.isCancelled { _xGm0054 = ._xPm0016(error.localizedDescription) } }
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
                _xGm0121
            }
            .padding(.horizontal, 24).padding(.bottom, 30)
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { _xGm0122._xGm0056() }
    }

    private var _xGm0119: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("On view").font(_XGm0033Bl._xGm0112(34)).foregroundStyle(_XGm0032Bl._xGm0106)
            Rectangle().fill(_XGm0032Bl._xGm0108).frame(width: 50, height: 2)
        }
        .padding(.top, 8)
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
