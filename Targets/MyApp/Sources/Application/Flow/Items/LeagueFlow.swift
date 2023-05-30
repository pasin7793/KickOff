
import RxFlow
import RxRelay
import UIKit

struct LeagueStepper: Stepper{
    let steps: PublishRelay<Step> = .init()
    
    var initialStep: Step{
        return KOStep.leagueIsRequired
    }
}

final class LeagueFlow: Flow{
    // MARK: - Properties
    var root: Presentable{
        return self.rootVC
    }
    
    @Inject private var vc: LeagueVC
    @Inject var stepper: LeagueStepper
    private let rootVC = UINavigationController()
    
    // MARK: - Init
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    // MARK: - Navigate
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step.asKOStep else { return .none }
        switch step{
        case .leagueIsRequired:
            return coordinateToLeague()
        default:
            return .none
        }
    }
}

// MARK: - Method
private extension LeagueFlow{
    func coordinateToLeague() -> FlowContributors{
        self.rootVC.setViewControllers([vc], animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vc.reactor ?? .init()))
    }
}
