import RxFlow
import RxRelay
import RxSwift
import UIKit

struct MainTabbarStepper: Stepper {
    let steps: PublishRelay<Step> = .init()

    var initialStep: Step {
        return KOStep.clubListIsRequired
    }
}

final class MainTabbarFlow: Flow {
    // MARK: - Properties
    var root: Presentable {
        return self.rootVC
    }

    let stepper: MainStepper = .init()
    private let rootVC = UINavigationController()

    // MARK: - Init
    deinit {
        print("\(type(of: self)): \(#function)")
    }

    // MARK: - Navigate
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step.asKOStep else { return .none }
        switch step {
        
        default:
            return .none
        }
    }
}

// MARK: - Method
private extension MainTabbarFlow {
    func coordinateToClubList() -> FlowContributors {
        let vc = AppDelegate.container.resolve(HomeVC.self)!
        self.rootVC.setViewControllers([vc], animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vc.reactor!))
    }
    func navigateToDetailClub(clubID: Int) -> FlowContributors {
        let reactor = AppDelegate.container.resolve(DetailClubReactor.self, argument: clubID)!
        let vc = DetailClubVC(reactor: reactor)
        self.rootVC.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: reactor))
    }
    func navigateToMyPage() -> FlowContributors {
        let vc = AppDelegate.container.resolve(MyPageVC.self)!
        self.rootVC.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vc.reactor!))
    }
    func presentToAlert(title: String?, message: String?, style: UIAlertController.Style, actions: [UIAlertAction]) -> FlowContributors {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        actions.forEach { alert.addAction($0) }
        self.rootVC.topViewController?.present(alert, animated: true)
        return .none
    }
    func presentToMemberAppend(closure: @escaping (([User]) -> Void), clubType: ClubType) -> FlowContributors {
        let reactor = AppDelegate.container.resolve(MemberAppendReactor.self, arguments: closure, clubType)!
        let vc = MemberAppendVC(reactor: reactor)
        self.rootVC.topViewController?.presentPanModal(vc)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: reactor))
    }
    func dismiss() -> FlowContributors {
        self.rootVC.topViewController?.dismiss(animated: true)
        return .none
    }
    func navigateToFirstNewClub() -> FlowContributors {
        let reactor = AppDelegate.container.resolve(NewClubReactor.self)!
        let vc = FirstNewClubVC(reactor: reactor)
        self.rootVC.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: reactor))
    }
    func navigateToSecondNewClub(reactor: NewClubReactor) -> FlowContributors {
        let vc = SecondNewClubVC(reactor: reactor)
        self.rootVC.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: reactor))
    }
    func navigateToThirdNewClub(reactor: NewClubReactor) -> FlowContributors {
        let vc = ThirdNewClubVC(reactor: reactor)
        self.rootVC.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: reactor))
    }
    func navigateToFirstUpdateClub(club: Club) -> FlowContributors {
        let reactor = AppDelegate.container.resolve(UpdateClubReactor.self, argument: club)!
        let vc = FirstUpdateClubVC(reactor: reactor)
        self.rootVC.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: reactor))
    }
    func navigateToSecondUpdateClub(reactor: UpdateClubReactor) -> FlowContributors {
        let vc = SecondUpdateClubVC(reactor: reactor)
        self.rootVC.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: reactor))
    }
    func presentToFailureAlert(title: String?, message: String?, action: [UIAlertAction] = []) -> FlowContributors {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if !action.isEmpty {
            action.forEach(alert.addAction(_:))
        } else {
            alert.addAction(.init(title: "확인", style: .default))
        }
        self.rootVC.topViewController?.present(alert, animated: true)
        return .none
    }
    func navigateToClubMembers(clubID: Int, isHead: Bool, isOpened: Bool) -> FlowContributors {
        let reactor = AppDelegate.container.resolve(ClubMemberReactor.self, arguments: clubID, isOpened)!
        let vc = ClubMemberVC(reactor: reactor, isHead: isHead)
        self.rootVC.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: reactor))
    }
    func popToRoot() -> FlowContributors {
        self.rootVC.popToRootViewController(animated: true)
        return .none
    }
}
