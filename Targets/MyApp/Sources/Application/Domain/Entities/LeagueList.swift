import Foundation

// MARK: - League
struct LeagueList {
    let tabs, allAvailableSeasons: [String]
    let details: Details
    let seostr: String
    let qaData: [Any?]
    let table: [TableElement]
    let transfers: NSNull
    let news: News
    let overview: Overview
    let stats: Stats
    let matches: Matches
    let playoff: NSNull
}

// MARK: - Details
struct Details {
    let id: Int
    let type, name, selectedSeason, latestSeason: String
    let shortName, country: String
    let faqJSONLD: NSNull
    let breadcrumbJSONLD: BreadcrumbJSONLD
}

// MARK: - BreadcrumbJSONLD
struct BreadcrumbJSONLD {
    let context: String
    let type: String
    let itemListElement: [ItemListElement]
}

// MARK: - ItemListElement
struct ItemListElement {
    let type: String
    let position: Int
    let name: String
    let item: String
}

// MARK: - Matches
struct Matches {
    let firstUnplayedMatch: FirstUnplayedMatch
    let allMatches: [AllMatch]
}

// MARK: - AllMatch
struct AllMatch {
    let round, roundName: Int
    let pageURL, id: String
    let home, away: AllMatchAway
    let status: Status
}

// MARK: - AllMatchAway
struct AllMatchAway {
    let name, shortName: Name
    let id: String
}

enum Name {
    //League1
    case daeguFC
    case daejeonCitizen
    case daejeonHanaCitizen
    case fcSeoul
    case gangwonFC
    case gwangjuFC
    case incheonUnited
    case jejuUnited
    case jeonbukFC
    case pohangSteelers
    case suwonBluewings
    case suwonFC
    case ulsanHyundai
    //League2
    case ansanGreeners
    case bucheonFC1995
    case busanIPark
    case cheonanCity
    case cheongjuFC
    case chungnamAsanFC
    case fcAnyang
    case gimcheonSangmu
    case gimpoFC
    case gyeongnamFC
    case jeonnamDragons
    case seongnamFC
    case seoulELandFC
}

// MARK: - Status
struct Status {
    let utcTime: String
    let finished, started, cancelled: Bool
    let scoreStr: String?
    let reason: Reason?
}

// MARK: - Reason
struct Reason {
    let short: Short
    let shortKey: ShortKey
    let long: Long
    let longKey: LongKey
}

enum Long {
    case fullTime
}

enum LongKey {
    case finished
}

enum Short {
    case ft
}

enum ShortKey {
    case fulltimeShort
}

// MARK: - FirstUnplayedMatch
struct FirstUnplayedMatch {
    let firstRoundWithUnplayedMatch, firstUnplayedMatchIndex: Int
    let firstUnplayedMatchID: String
}

// MARK: - News
struct News {
    let data: [NewsData]
    let totalItems: Int
}

// MARK: - Datum
struct NewsData {
    let imageURL: String
    let title, gmtTime: String
    let sourceStr: SourceStr
    let sourceIconURL: String
    let page: Page
}

// MARK: - Page
struct Page {
    let url: String
}

enum SourceStr {
    case youTube
}

// MARK: - Overview
struct Overview {
    let season, selectedSeason: String
    let news: News
    let table: [TableElement]
    let topPlayers: TopPlayers
    let hasTotw: Bool
    let leagueOverviewMatches: [LeagueOverviewMatch]
}

// MARK: - LeagueOverviewMatch
struct LeagueOverviewMatch {
    let id, pageURL: String
    let opponent, home, away: OpponentClass
    let displayTournament: Bool
    let lnameArr: [LnameArr]
    let notStarted: Bool
    let tournament: Tournament
    let status: Status
}

// MARK: - OpponentClass
struct OpponentClass {
    let id: String
    let name: Name
    let score: Int?
}

enum LnameArr {
    case a
    case undefined
}

// MARK: - Tournament
struct Tournament {
}

// MARK: - TableElement
struct TableElement {
    let data: DataClass
    let teamForm: [String: [TeamForm]]
    let nextOpponent: [String: [String]]
    let tableHeader: TableHeader
}

// MARK: - DataClass
struct DataClass {
    let ccode: String
    let leagueID: Int
    let pageURL, leagueName: String
    let legend: [Legend]
    let ongoing: [Any?]
    let table: DataTable
    let tableFilterTypes: [String]
    let composite: Bool
    let selectedSeason: String
    let isCurrentSeason: Bool
}

// MARK: - Legend
struct Legend {
    let title, tKey: String
    let color: Color
    let indices: [Int]
}

enum Color {
    case ffd908
    case the2Ad572
}

// MARK: - DataTable
struct DataTable {
    let all, home, away, form: [All]
}

// MARK: - All
struct All {
    let name, shortName: String
    let id: Int
    let pageURL: String
    let deduction: NSNull?
    let ongoing: NSNull
    let played, wins, draws, losses: Int
    let scoresStr: String
    let goalConDiff, pts, idx: Int
    let qualColor: Color?
    let featuredInMatch: Bool?
}

// MARK: - TableHeader
struct TableHeader {
    let staticTableHeaders, dynamicTableHeaders: [String]
}

// MARK: - TeamForm
struct TeamForm {
    let result: Int
    let resultString: ResultString
    let imageURL: String
    let linkToMatch: String
    let date: NSNull
    let teamPageURL: String
    let tooltipText: TooltipText
    let score: String
    let home, away: TeamFormAway
}

// MARK: - TeamFormAway
struct TeamFormAway {
    let isOurTeam: Bool
}

enum ResultString {
    case d
    case l
    case w
}

// MARK: - TooltipText
struct TooltipText {
    let utcTime: String
    let homeTeam: Name
    let homeTeamID, homeScore: Int
    let awayTeam: Name
    let awayTeamID, awayScore: Int
}

// MARK: - TopPlayers
struct TopPlayers {
    let byRating, byGoals, byAssists: [By]
    let seeAllURL: String
}

// MARK: - By
struct By {
    let id: Int
    let name: String
    let rank: Int
    let goals, assists, rating, positionID: NSNull
    let ccode, cname: NSNull
    let teamID: Int
    let teamName: String
    let showRole, showCountryFlag: NSNull
    let showTeamFlag, excludeFromRanking: Bool
    let value: Double
}

// MARK: - Stats
struct Stats {
    let players, teams: [Player]
    let trophies: [Any?]
    let seasonStatLinks: [SeasonStatLink]
    let seasonsWithLinks: [String]
}

// MARK: - Player
struct Player {
    let header: String
    let participant: Participant
    let fetchAllURL: String
    let topThree: [Participant]
    let order: Int
    let name, localizedTitleID: String
}

// MARK: - Participant
struct Participant {
    let id: Int
    let name: String
    let rank: Int
    let goals, assists, rating, positionID: NSNull
    let ccode, cname: NSNull
    let teamID: Int
    let teamName: String?
    let showRole, showCountryFlag: NSNull
    let showTeamFlag, excludeFromRanking: Bool
    let value: Value
    let teamColor: TeamColor?
}

enum TeamColor {
    case b06008
    case b81020
    case the000028
    case the001028
    case the001830
    case the005898
    case the200848
    case the333333
    case the702878
    case the801818
    case the986808
}

enum Value {
    case integer(Int)
    case string(String)
}

// MARK: - SeasonStatLink
struct SeasonStatLink {
    let name, countryCode, relativePath, league: String
    let stageID, templateID, tournamentID: Int
    let totwRoundsLink: String
}
