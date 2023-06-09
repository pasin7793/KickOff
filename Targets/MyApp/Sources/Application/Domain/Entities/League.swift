
import Foundation

struct LeagueList: Codable{
    let seostr: String?
    let table: [TableElement]
}

struct TableElement: Codable {
    let data: DataClass
}

struct DataClass: Codable {
    let table: DataTable
}

struct DataTable: Codable {
    let all: [League]
}
struct League: Codable {
    let name, shortName: String?
    let id: Int
    let pageUrl: String?
    let played, wins, draws, losses: Int
    let scoresStr: String?
    let goalConDiff, pts, idx: Int
    let qualColor: String?
}
