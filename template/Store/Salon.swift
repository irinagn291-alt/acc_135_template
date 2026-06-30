import Foundation
import Combine

@MainActor
final class _XGm0031Bl: ObservableObject {
    @Published private(set) var _xGm0125: [_XGm0005Bl] = []

    private let _xGm0095 = "gallea.salon.v2"
    private let _xGm0096: UserDefaults
    init(store: UserDefaults = .standard) { self._xGm0096 = store; _xGm0125 = _xGm0102() }

    func _xGm0097(ref: Int) -> _XGm0004Bl? { _xGm0125.first { $0._xGm0010._xGm0016 == ref }?._xGm0011 }
    func _xGm0126(_ placement: _XGm0004Bl) -> [_XGm0005Bl] {
        _xGm0125.filter { $0._xGm0011 == placement }.sorted { $0._xGm0015 > $1._xGm0015 }
    }

    @discardableResult
    func _xGm0098(_ work: _XGm0006Bl, at placement: _XGm0004Bl) -> _XGm0005Bl {
        if let i = _xGm0125.firstIndex(where: { $0._xGm0010._xGm0016 == work._xGm0016 }) {
            _xGm0125[i]._xGm0011 = placement; _xGm0101(); return _xGm0125[i]
        }
        let f = _XGm0005Bl(work: work, placement: placement); _xGm0125.insert(f, at: 0); _xGm0101(); return f
    }
    func _xGm0099(ref: Int) { _xGm0125.removeAll { $0._xGm0010._xGm0016 == ref }; _xGm0101() }
    func _xGm0100(ref: Int, _ change: (inout _XGm0005Bl) -> Void) {
        guard let i = _xGm0125.firstIndex(where: { $0._xGm0010._xGm0016 == ref }) else { return }
        change(&_xGm0125[i]); _xGm0101()
    }

    private func _xGm0101() { if let b = try? JSONEncoder().encode(_xGm0125) { _xGm0096.set(b, forKey: _xGm0095) } }
    private func _xGm0102() -> [_XGm0005Bl] {
        guard let b = _xGm0096.data(forKey: _xGm0095),
              let d = try? JSONDecoder().decode([_XGm0005Bl].self, from: b) else { return [] }
        return d
    }
}
