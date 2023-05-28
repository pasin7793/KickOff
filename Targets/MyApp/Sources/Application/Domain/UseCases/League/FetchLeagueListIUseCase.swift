import RxSwift

public struct FetchLeagueListUseCase {
    public init(LeagueRepository: LeagueRepository) {
        self.leagueRepository = LeagueRepository
    }

    private let leagueRepository: LeagueRepository

    public func execute(type: LeagueType) -> Observable<[League]> {
        leagueRepository.fetchLeagueList(type: type)
    }
}
