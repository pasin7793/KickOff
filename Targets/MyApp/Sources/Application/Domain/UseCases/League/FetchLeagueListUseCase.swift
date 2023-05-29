import RxSwift

public struct FetchDetailLeagueUseCase {
    public init(leagueRepository: LeagueRepository) {
        self.leagueRepository = leagueRepository
    }

    private let leagueRepository: LeagueRepository

    public func execute(id: Int) -> Single<League> {
        leagueRepository.fetchDetailLeague(id: id)
    }
}
