import Swinject

final class ReactorAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MainTabbarReactor.self) { r in
            MainTabbarReactor(
                fetchLeagueListUseCase: r.resolve(FetchLeagueListUseCase.self)!)
        }
    }
}
