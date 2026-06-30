import Foundation

private func _sd(_ b: String) -> String { String(data: Data(base64Encoded: b) ?? Data(), encoding: .utf8) ?? "" }

enum _XGm0007Bl: LocalizedError {
    case _xPm0006
    case _xPm0007
    var errorDescription: String? {
        switch self {
        case ._xPm0006: return "No works matched."
        case ._xPm0007: return "The archive is unavailable."
        }
    }
}

protocol _XGm0008Bl: Sendable {
    func _xGm0057(_ term: String) async throws -> [_XGm0006Bl]
    func _xGm0058() async throws -> [_XGm0006Bl]
    func _xGm0059(_ id: Int) async throws -> _XGm0006Bl
}

final class _XGm0009Bl: _XGm0008Bl, Sendable {
    private let _xGm0029 = _sd("aHR0cHM6Ly9jb2xsZWN0aW9uYXBpLm1ldG11c2V1bS5vcmcvcHVibGljL2NvbGxlY3Rpb24vdjE=")
    private let _xGm0028: URLSession
    init(session: URLSession = .shared) { self._xGm0028 = session }

    func _xGm0057(_ term: String) async throws -> [_XGm0006Bl] {
        let ids = try await _xGm0030(query: term)
        return try await _xGm0031(ids, limit: 24)
    }

    func _xGm0058() async throws -> [_XGm0006Bl] {
        let ids = try await _xGm0030(query: "painting")
        return try await _xGm0031(ids, limit: 24)
    }

    func _xGm0059(_ id: Int) async throws -> _XGm0006Bl {
        guard let work = try await _xGm0032(id), work._xGm0025() != nil else {
            throw _XGm0007Bl._xPm0007
        }
        return work
    }

    private func _xGm0030(query: String) async throws -> [Int] {
        let q = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: "\(_xGm0029)/search?hasImages=true&isPublicDomain=true&q=\(q)") else {
            throw _XGm0007Bl._xPm0007
        }
        let data = try await _xGm0033(url)
        let hit = try JSONDecoder().decode(_XGm0010Bl.self, from: data)
        guard !hit._xGm0044.isEmpty else { throw _XGm0007Bl._xPm0006 }
        return hit._xGm0044
    }

    private func _xGm0031(_ ids: [Int], limit: Int) async throws -> [_XGm0006Bl] {
        let pool = Array(ids.prefix(limit * 3))
        let works = await withTaskGroup(of: _XGm0006Bl?.self, returning: [_XGm0006Bl].self) { group in
            for id in pool { group.addTask { try? await self._xGm0032(id) } }
            var out: [_XGm0006Bl] = []
            for await work in group {
                guard let work, work._xGm0025() != nil else { continue }
                out.append(work)
            }
            return out
        }
        let slice = Array(works.prefix(limit))
        if slice.isEmpty { throw _XGm0007Bl._xPm0006 }
        return slice
    }

    private func _xGm0032(_ id: Int) async throws -> _XGm0006Bl? {
        guard let url = URL(string: "\(_xGm0029)/objects/\(id)") else { return nil }
        let data = try await _xGm0033(url)
        let raw = try JSONDecoder().decode(_XGm0011Bl.self, from: data)
        return raw._xGm0034()
    }

    private func _xGm0033(_ url: URL) async throws -> Data {
        var req = URLRequest(url: url)
        req.setValue(_sd("R2FsbGVhLzEuMCAoZ2FsbGVhLmFwcCk="), forHTTPHeaderField: "User-Agent")
        guard
            let (data, resp) = try? await _xGm0028.data(for: req),
            let http = resp as? HTTPURLResponse, (200..<300).contains(http.statusCode)
        else { throw _XGm0007Bl._xPm0007 }
        return data
    }

    private struct _XGm0010Bl: Decodable {
        let _xGm0044: [Int]
        private enum CodingKeys: String, CodingKey {
            case _xGm0044 = "objectIDs"
        }
    }

    private struct _XGm0011Bl: Decodable {
        let _xGm0035: Int
        let _xGm0017: String?
        let _xGm0036: String?
        let _xGm0037: String?
        let _xGm0038: String?
        let _xGm0039: String?
        let _xGm0022: String?
        let _xGm0023: String?
        let _xGm0040: String?
        let _xGm0041: String?
        let _xGm0042: String?
        let _xGm0043: Bool?

        private enum CodingKeys: String, CodingKey {
            case _xGm0035 = "objectID"
            case _xGm0017 = "title"
            case _xGm0036 = "artistDisplayName"
            case _xGm0037 = "objectDate"
            case _xGm0038 = "primaryImageSmall"
            case _xGm0039 = "primaryImage"
            case _xGm0022 = "medium"
            case _xGm0023 = "department"
            case _xGm0040 = "culture"
            case _xGm0041 = "period"
            case _xGm0042 = "creditLine"
            case _xGm0043 = "isPublicDomain"
        }

        func _xGm0034() -> _XGm0006Bl? {
            guard _xGm0043 != false else { return nil }
            let thumb = _xGm0038?.isEmpty == false ? _xGm0038 : nil
            let full = _xGm0039?.isEmpty == false ? _xGm0039 : nil
            guard thumb != nil || full != nil else { return nil }
            let note = [_xGm0040, _xGm0041, _xGm0042]
                .compactMap { $0?.trimmingCharacters(in: .whitespacesAndNewlines) }
                .filter { !$0.isEmpty }
                .joined(separator: " · ")
            return _XGm0006Bl(
                _xGm0016: _xGm0035,
                _xGm0017: _xGm0017 ?? "Untitled",
                _xGm0018: _xGm0036,
                _xGm0019: _xGm0037,
                _xGm0020: thumb,
                _xGm0021: full,
                _xGm0022: _xGm0022,
                _xGm0023: _xGm0023,
                _xGm0024: note.isEmpty ? nil : note
            )
        }
    }
}
