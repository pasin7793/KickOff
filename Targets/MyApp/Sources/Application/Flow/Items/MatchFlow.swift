
import RxFlow
import RxRelay
import UIKit

struct MatchStepper: Stepper{
    let steps: PublishRelay<Step> = .init()
    
    var initialStep: Step{
        return KOStep.matchIsRequired
    }
}

final class MatchFlow: Flow{
    // MARK: - Properties
    var root: Presentable{
        return self.rootVC
    }
    
    @Inject private var vc: MatchVC
    @Inject var stepper: MatchStepper
    private let rootVC = UINavigationController()
    
    // MARK: - Init
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    // MARK: - Navigate
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step.asKOStep else { return .none }
        switch step{
        case .matchIsRequired:
            return coordinatorToMatch()
        default:
            return .none
        }
    }
}

// MARK: - Method
private extension MatchFlow{
    func coordinatorToMatch() -> FlowContributors{
        self.rootVC.setViewControllers([vc], animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vc.reactor ?? .init()))
    }
}
