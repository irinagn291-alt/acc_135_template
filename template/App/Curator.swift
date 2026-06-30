import SwiftUI

enum _XGm0001Bl {
    case _xPm0003
    case _xPm0004
    case _xPm0005
}

@MainActor
final class _XGm0002Bl: ObservableObject {
    @Published var _xGm0001: _XGm0001Bl = ._xPm0003
    @AppStorage("gallea.primerSeen") private var _xGm0128 = false

    func _xGm0002() { _xGm0004(_xGm0128 ? ._xPm0005 : ._xPm0004) }
    func _xGm0003() { _xGm0128 = true; _xGm0004(._xPm0005) }
    private func _xGm0004(_ d: _XGm0001Bl) { withAnimation(.easeInOut(duration: 0.6)) { _xGm0001 = d } }
}

@MainActor
final class _XGm0003Bl: ObservableObject {
    let _xGm0005: _XGm0008Bl
    let _xGm0006: _XGm0031Bl
    let _xGm0007: _XGm0002Bl
    init(art: _XGm0008Bl = _XGm0009Bl()) {
        self._xGm0005 = art
        self._xGm0006 = _XGm0031Bl()
        self._xGm0007 = _XGm0002Bl()
    }
}
