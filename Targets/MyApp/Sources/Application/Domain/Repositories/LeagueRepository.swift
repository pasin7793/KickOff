import RxSwift

public protocol LeagueRepository {
    func fetchLeagueList(type: LeagueType) -> Observable<[LeagueList]>
}
