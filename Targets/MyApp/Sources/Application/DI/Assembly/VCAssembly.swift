import Swinject

final class VCAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MainTabbarVC.self) { r in
            let reactor = r.resolve(MainTabbarReactor.self)
            let tabbar = MainTabbarVC(reactor: reactor)
            tabbar.setViewControllers([
                MatchVC(reactor: reactor)
            ])
            return tabbar
        }
    }
}
