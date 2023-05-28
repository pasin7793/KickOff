public struct LeagueList: Equatable {
    public let id: Int
    public let type: LeagueType
    public let name: String

    public init(
        id: Int,
        type: LeagueType,
        name: String
    ) {
        self.id = id
        self.type = type
        self.name = name
    }
}
