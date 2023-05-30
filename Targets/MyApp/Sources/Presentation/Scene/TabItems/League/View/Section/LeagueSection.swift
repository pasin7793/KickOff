import RxDataSources

struct LeagueSection: SectionModelType {
    let header: String
    var items: [PostList]
}

extension PostSection {
    typealias Item = PostList
    
    init(original: PostSection, items: [PostList]) {
        self = original
        self.items = items
    }
}
