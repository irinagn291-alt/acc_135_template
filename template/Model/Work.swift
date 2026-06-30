import Foundation

struct _XGm0006Bl: Identifiable, Codable, Hashable {
    let _xGm0016: Int
    let _xGm0017: String
    let _xGm0018: String?
    let _xGm0019: String?
    let _xGm0020: String?
    let _xGm0021: String?
    let _xGm0022: String?
    let _xGm0023: String?
    let _xGm0024: String?

    var id: Int { _xGm0016 }

    func _xGm0025(large: Bool = false) -> URL? {
        let raw = large ? (_xGm0021 ?? _xGm0020) : (_xGm0020 ?? _xGm0021)
        return raw.flatMap(URL.init(string:))
    }

    var _xGm0026: String { _xGm0018?.isEmpty == false ? _xGm0018! : "Unknown artist" }
    var _xGm0027: String { [_xGm0026, _xGm0019].compactMap { $0 }.joined(separator: ", ") }

    private enum CodingKeys: String, CodingKey {
        case _xGm0016 = "ref"
        case _xGm0017 = "title"
        case _xGm0018 = "artist"
        case _xGm0019 = "dateText"
        case _xGm0020 = "thumbURL"
        case _xGm0021 = "imageURL"
        case _xGm0022 = "medium"
        case _xGm0023 = "department"
        case _xGm0024 = "blurb"
    }
}
