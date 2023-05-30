

import RxFlow
import RxRelay
import UIKit

struct NewsStepper: Stepper{
    let steps: PublishRelay<Step> = .init()
    
    var initialStep: Step{
        return KOStep.newsIsRequired
    }
}

final class NewsFlow: Flow{
    // MARK: - Properties
    var root: Presentable{
        return self.rootVC
    }
    
    @Inject private var vc: NewsVC
    @Inject var stepper: NewsStepper
    private let rootVC = UINavigationController()
    
    // MARK: - Init
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    // MARK: - Navigate
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step.asKOStep else { return .none }
        switch step{
        case .newsIsRequired:
            return coordinateToNews()
        default:
            return .none
        }
    }
}

// MARK: - Method
private extension NewsFlow{
    func coordinateToNews() -> FlowContributors{
        self.rootVC.setViewControllers([vc], animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vc.reactor ?? .init()))
    }
}
