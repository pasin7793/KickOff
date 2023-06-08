
import Foundation

// MARK: - Football
struct LeagueList: Codable{
    let seostr: String
    let table: [TableElement]
}

// MARK: - TableElement
struct TableElement: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let table: DataTable
}

// MARK: - DataTable
struct DataTable: Codable {
    let all: [League]
}

// MARK: - All
struct League: Codable {
    let name, shortName: String
    let id: Int
    let pageUrl: String
    let played, wins, draws, losses: Int
    let scoresStr: String
    let goalConDiff, pts, idx: Int
    let qualColor: String
}
