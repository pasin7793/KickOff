import RxFlow
import UIKit

final class TabBarFlow: Flow {
    
    enum TabIndex: Int {
        case home = 0
        case qrCode = 1
        case outing = 2
    }
    
    var root: Presentable {
        return self.rootVC
    }
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()
    
    private let rootVC = MainTabbarVC()
    
    private var matchFlow = MatchFlow()
    private var newsFlow = NewsFlow()
    private var leagueFlow = LeagueFlow()
    
    init() {}
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? KOStep else {return .none}
        
        switch step {
        case .mainTabbarIsRequired:
            return coordinateToTabbar(index: 0)
            
        case .matchIsRequired:
            return coordinateToTabbar(index: 1)
            
        case .newsIsRequired:
            return coordinateToTabbar(index: 2)
            
        default:
            return .none
        }
    }
    
}

private extension TabBarFlow {
    func coordinateToTabbar(index: Int) -> FlowContributors {
        Flows.use(
            matchFlow, newsFlow, leagueFlow,
            when: .ready
        ) { [unowned self] (root1: UINavigationController,
                            root2: UINavigationController,
                            root3: UINavigationController) in
            let matchItem = UITabBarItem(
                title: nil,
                image: UIImage(systemName: "sportscourt.fill"),
                selectedImage: UIImage(systemName: "sportscourt.fill")
            )
            
            let newsItem = UITabBarItem(
                title: nil,
                image: UIImage(systemName: "newspaper.fill"),
                selectedImage: UIImage(systemName: "newspaper.fill")
            )
            
            let leagueItem = UITabBarItem(
                title: nil,
                image: UIImage(systemName: "trophy.fill"),
                selectedImage: UIImage(systemName: "trophy.fill")
            )
            root1.tabBarItem = matchItem
            root2.tabBarItem = newsItem
            root3.tabBarItem = leagueItem
            
            self.rootVC.setViewControllers([root1,root2,root3], animated: true)
            self.rootVC.selectedIndex = index

        }
        return .multiple(flowContributors: [
            .contribute(withNextPresentable: matchFlow, withNextStepper: matchFlow.stepper),
            .contribute(withNextPresentable: newsFlow, withNextStepper: newsFlow.stepper),
            .contribute(withNextPresentable: leagueFlow, withNextStepper: leagueFlow.stepper)
        ])
    }
}
