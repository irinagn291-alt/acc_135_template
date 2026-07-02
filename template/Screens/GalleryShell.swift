import SwiftUI

enum _XGm0017Bl: Hashable {
    case _xPm0008(_XGm0006Bl)
    case _xPm0009
    case _xPm0010
}

struct _XGm0018Bl: View {
    @EnvironmentObject private var _xGm0094: _XGm0003Bl
    @State private var _xGm0247 = 0
    @State private var _xGm0246 = false

    var body: some View {
        TabView(selection: $_xGm0247) {
            _xGm0248
                .tabItem { Label("Explore", systemImage: "magnifyingglass") }.tag(0)

            NavigationStack {
                _XGm0023Bl()
                    .navigationDestination(for: _XGm0017Bl.self) { _xGm0249($0) }
            }
            .tabItem { Label("Saved", systemImage: "square.grid.2x2") }.tag(1)

            NavigationStack { _XGm0260Bl(_xGm0005: _xGm0094._xGm0005) }
                .tabItem { Label("Quiz", systemImage: "questionmark.circle") }.tag(2)

            NavigationStack { _XGm0012Bl() }
                .tabItem { Label("About", systemImage: "info.circle") }.tag(3)
        }
        .tint(_XGm0032Bl._xGm0106)
        .sheet(isPresented: $_xGm0246) {
            _XGm0200Bl().environmentObject(_xGm0094._xGm0006)
        }
    }

    private var _xGm0248: some View {
        NavigationStack {
            _XGm0016Bl()
                .background(_XGm0032Bl._xGm0103.ignoresSafeArea())
                .navigationDestination(for: _XGm0017Bl.self) { _xGm0249($0) }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button { _xGm0246 = true } label: { Image(systemName: "plus") }
                            .foregroundStyle(_XGm0032Bl._xGm0106)
                    }
                }
        }
    }

    @ViewBuilder
    private func _xGm0249(_ route: _XGm0017Bl) -> some View {
        switch route {
        case ._xPm0008(let w): _XGm0030Bl(_xGm0010: w)
        case ._xPm0009: _XGm0023Bl()
        case ._xPm0010: _XGm0012Bl()
        }
    }
}
