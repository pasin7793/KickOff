import Foundation

// MARK: - Match
struct Match {
    let leagues: [Leagues]
    let date: String
}

// MARK: - Leagues
struct Leagues {
    let ccode: String = "KOR"
    let id, primaryID: Int
    let name: String
    let matches: [MatchList]
    let parentLeagueID: Int?
    let internalRank, liveRank: Int
    let simpleLeague: Bool
}

// MARK: - MatchElement
struct MatchList {
    let id, leagueID: Int
    let time: String
    let home, away: HomeAway
    let eliminatedTeamID: NSNull
    let statusID: Int
    let tournamentStage: String
    let status: Status
    let timeTS: Int
}

// MARK: - Away
struct HomeAway {
    let id, score: Int
    let name, longName: String
}

// MARK: - Status
struct Status {
    let utcTime: String
    let started, cancelled, finished: Bool
    let reason: Reason?
}

// MARK: - Reason
struct Reason {
    let short, shortKey, long, longKey: String
}
