import RxDataSources

struct MatchSection{
    var items: [Match]
    
    init(items: [Match]) {
        self.items = items
    }
}

extension MatchSection: SectionModelType{
    
    typealias Item = Match
    
    init(original: MatchSection, items: [Match]) {
        self = original
        self.items = items
    }
}
