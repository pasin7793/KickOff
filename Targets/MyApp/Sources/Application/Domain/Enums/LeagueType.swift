public enum LeagueType: String, Codable, CaseIterable {
    case league1 = "K League 1"
    case league2 = "K League 2"
}

public extension LeagueType {
    var display: String {
        switch self {
        case .league1: return "K리그1"
        case .league2: return "K리그2"
        }
    }
}
