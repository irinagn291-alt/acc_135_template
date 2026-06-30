import SwiftUI

struct _XGm0038Bl: View {
    @EnvironmentObject private var _xGm0007: _XGm0002Bl

    var body: some View {
        ZStack {
            _XGm0032Bl._xGm0103.ignoresSafeArea()
            switch _xGm0007._xGm0001 {
            case ._xPm0003: _XGm0020Bl()
            case ._xPm0004: _XGm0021Bl()
            case ._xPm0005: _XGm0018Bl()
            }
        }
        .preferredColorScheme(.light)
        .tint(_XGm0032Bl._xGm0106)
    }
}
