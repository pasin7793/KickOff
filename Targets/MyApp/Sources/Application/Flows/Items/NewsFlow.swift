
import RxFlow
import UIKit
import RxCocoa
import RxSwift

struct NewsStepper: Stepper{
    var steps = PublishRelay<Step>()

    var initialStep: Step{
        return KOStep.newsIsRequired
    }
}

class NewsFlow: Flow {

    var root: Presentable {
        return self.rootViewController
    }
    
    var stepper = NewsStepper()
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()

    init(){}
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? KOStep else { return .none }
        switch step {
        case .newsIsRequired:
            return newsIsRequired()
        
        default:
            return .none
        }
    }
    
    private func newsIsRequired() -> FlowContributors{
        let vm = NewsViewModel()
        let vc = NewsVC(vm)
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
}
