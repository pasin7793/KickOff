import RxSwift

public protocol LeagueRepository {
    func fetchLeagueList() -> Observable[]
}
