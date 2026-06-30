import Foundation

enum _XGm0004Bl: String, Codable, CaseIterable, Identifiable {
    case _xPm0001 = "collected"
    case _xPm0002 = "toVisit"

    var id: String { rawValue }
    var _xGm0008: String { self == ._xPm0001 ? "My gallery" : "To visit" }
    var _xGm0009: String { self == ._xPm0001 ? "square.grid.2x2.fill" : "mappin.circle.fill" }
}

struct _XGm0005Bl: Identifiable, Codable, Hashable {
    let id: UUID
    let _xGm0010: _XGm0006Bl
    var _xGm0011: _XGm0004Bl
    var _xGm0012: Bool
    var _xGm0013: Bool
    var _xGm0014: String
    let _xGm0015: Date

    init(work: _XGm0006Bl, placement: _XGm0004Bl = ._xPm0001) {
        self.id = UUID()
        self._xGm0010 = work
        self._xGm0011 = placement
        self._xGm0012 = false
        self._xGm0013 = false
        self._xGm0014 = ""
        self._xGm0015 = Date()
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case _xGm0010 = "work"
        case _xGm0011 = "placement"
        case _xGm0012 = "adored"
        case _xGm0013 = "seenInPerson"
        case _xGm0014 = "reflection"
        case _xGm0015 = "hungAt"
    }
}
