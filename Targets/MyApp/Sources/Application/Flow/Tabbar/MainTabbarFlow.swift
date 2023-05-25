
import RxFlow
import UIKit

final class MainTabbarFlow: Flow{
    // MARK: - Properties
    enum TabIndex: Int {
        case match = 0
        case news
        case league
    }
    var root: Presentable{
        return self.rootVC
    }
    
    private let rootVC = MainTabbarVC()
    
    @Inject private var homeFlow: HomeFlow
    @Inject private var postListFlow: PostListFlow
    @Inject private var alarmFlow: AlarmFlow
    @Inject private var myPageFlow: MyPageFlow
    
    // MARK: - Init
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    // MARK: - Navigate
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step.asKOStep else { return .none }
        switch step{
        case .mainTabbarIsRequired:
            return coordinateToMainTabbar()
        default:
            return .none
        }
    }
}

// MARK: - Method
private extension MainTabbarFlow{
    func coordinateToMainTabbar() -> FlowContributors {
        Flows.use(
            homeFlow, postListFlow, alarmFlow,
            when: .created
        ) { [unowned self] (root1: UINavigationController,
                            root2: UINavigationController,
                            root3: UINavigationController) in
            let matchImage = UIImage(systemName: "sportscourt.fill")
            let newsImage = UIImage(systemName: "newspaper.fill")
            let leagueImage = UIImage(systemName: "trophy.fill")
            
            let matchSelectedImage = matchImage?.withTintColor(UIColor.orange, renderingMode: .alwaysOriginal)
            let newsSelectedImage = newsImage?.withTintColor(UIColor.orange, renderingMode: .alwaysOriginal)
            let leagueSelectedImage = leagueImage?.withTintColor(UIColor.orange, renderingMode: .alwaysOriginal)
            
            let matchItem = UITabBarItem(title: nil, image: matchImage, selectedImage: matchSelectedImage)
            let newsItem = UITabBarItem(title: nil, image: newsImage, selectedImage: newsSelectedImage)
            let leagueItem = UITabBarItem(title: nil, image: leagueImage, selectedImage: leagueSelectedImage)
            
            root1.tabBarItem = matchItem
            root2.tabBarItem = newsItem
            root3.tabBarItem = leagueItem
            
            self.rootVC.setViewControllers([root1, root2, root3], animated: true)
        }
        return .multiple(flowContributors: [
            .contribute(withNextPresentable: homeFlow, withNextStepper: homeFlow.stepper),
            .contribute(withNextPresentable: postListFlow, withNextStepper: postListFlow.stepper),
            .contribute(withNextPresentable: alarmFlow, withNextStepper: alarmFlow.stepper)
        ])
    }
}
