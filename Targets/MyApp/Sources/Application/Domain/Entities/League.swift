
import Foundation

// MARK: - Football
struct Football {
    let seostr: String
    let table: [TableElement]
    let playoff: Bool
}

// MARK: - TableElement
struct TableElement {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass {
    let table: DataTable
}

enum Color {
    case ffd908
    case the2Ad572
}

// MARK: - DataTable
struct DataTable {
    let all: [All]
}

// MARK: - All
struct All {
    let name, shortName: String
    let id: Int
    let pageURL: String
    let played, wins, draws, losses: Int
    let scoresStr: String
    let goalConDiff, pts, idx: Int
    let qualColor: Color?
}
