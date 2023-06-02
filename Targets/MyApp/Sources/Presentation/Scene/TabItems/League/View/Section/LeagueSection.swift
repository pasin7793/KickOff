import RxDataSources

struct LeagueSection: SectionModelType {
    let header: String
    var items: [All]
}

extension LeagueSection {
    typealias Item = All
    
    init(original: LeagueSection, items: [All]) {
        self = original
        self.items = items
    }
}
