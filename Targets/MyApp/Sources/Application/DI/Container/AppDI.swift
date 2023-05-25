
import Swinject
import SwinjectAutoregistration

extension Container{
    func registerDependencies(){
        registerVC()
        registerReactor()
        registerStepper()
        registerFlow()
        registerRepositories()
        registerUseCases()
    }
    
    // MARK: - View
    private func registerVC(){
        register(MatchVC.self) { r in
            return MatchVC(reactor: r.resolve(MatchReactor.self))
        }
        register(NewsVC.self) { r in
            return NewsVC(reactor: r.resolve(NewsReactor.self))
        }
        register(LeagueVC.self) { r in
            return LeagueVC(reactor: r.resolve(LeagueReactor.self))
        }
    }
    
    private func registerReactor(){
        autoregister(MatchReactor.self, initializer: MatchReactor.init)
        autoregister(NewsReactor.self, initializer: NewsReactor.init)
        autoregister(LeagueReactor.self, initializer: LeagueReactor.init)
    }
    
    private func registerStepper(){
        autoregister(MatchStepper.self, initializer: MatchStepper.init)
        autoregister(NewsStepper.self, initializer: NewsStepper.init)
        autoregister(LeagueStepper.self, initializer: LeagueStepper.init)
    }
    
    private func registerFlow(){
        autoregister(MatchFlow.self, initializer: MatchFlow.init)
        autoregister(NewsFlow.self, initializer: NewsFlow.init)
        autoregister(LeagueFlow.self, initializer: LeagueFlow.init)
        autoregister(MainTabbarFlow.self, initializer: MainTabbarFlow.init)
    }
    
    // MARK: - Data
    private func registerRepositories(){
        
    }
    
    private func registerUseCases(){
    }
}
