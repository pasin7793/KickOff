
import RxFlow
import UIKit
import RxCocoa
import RxSwift

struct MatchStepper: Stepper{
    var steps = PublishRelay<Step>()

    var initialStep: Step{
        return KOStep.matchIsRequired
    }
}

class MatchFlow: Flow {

    var root: Presentable {
        return self.rootViewController
    }
    
    var stepper = MatchStepper()
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()

    init(){}
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? KOStep else { return .none }
        switch step {
        case .matchIsRequired:
            return matchIsRequired()
        
        default:
            return .none
        }
    }
    
    private func matchIsRequired() -> FlowContributors{
        let vm = MatchViewModel()
        let vc = MatchVC(vm)
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
}
