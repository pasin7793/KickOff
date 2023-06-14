import Foundation

// MARK: - Match
struct MatchList: Codable{
    let leagues: [Leagues]
    let date: String
}

// MARK: - Leagues
struct Leagues: Codable{
    let ccode: String?
    let id, primaryID: Int?
    let name: String?
    let matches: [Match]
    let parentLeagueID: Int?
    let internalRank: Int?
}

// MARK: - MatchElement
struct Match: Codable{
    let id, leagueID: Int?
    let time: String?
    let home, away: HomeAway
    let tournamentStage: String?
    let status: Status
    let timeTS: Int?
}

// MARK: - Away
struct HomeAway: Codable{
    let id, score: Int?
    let name, longName: String?
}

// MARK: - Status
struct Status: Codable{
    let utcTime: String?
    let started, cancelled, finished: Bool?
}
