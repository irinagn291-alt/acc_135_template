import SwiftUI

enum _XGm0017Bl: Hashable {
    case _xPm0008(_XGm0006Bl)
    case _xPm0009
    case _xPm0010
}

struct _XGm0018Bl: View {
    @State private var _xGm0060: [_XGm0017Bl] = []

    var body: some View {
        NavigationStack(path: $_xGm0060) {
            _XGm0016Bl()
                .background(_XGm0032Bl._xGm0103.ignoresSafeArea())
                .navigationDestination(for: _XGm0017Bl.self) { route in
                    switch route {
                    case ._xPm0008(let w): _XGm0030Bl(_xGm0010: w)
                    case ._xPm0009: _XGm0023Bl()
                    case ._xPm0010: _XGm0012Bl()
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack(spacing: 18) {
                            Button { _xGm0060.append(._xPm0009) } label: { Image(systemName: "square.grid.2x2") }
                            Button { _xGm0060.append(._xPm0010) } label: { Image(systemName: "info.circle") }
                        }
                        .foregroundStyle(_XGm0032Bl._xGm0106)
                    }
                }
        }
        .tint(_XGm0032Bl._xGm0106)
    }
}
