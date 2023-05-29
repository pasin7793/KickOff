import RxSwift

public protocol LeagueRepository {
    func fetchDetailLeague(id: Int) -> Single<League>
}
