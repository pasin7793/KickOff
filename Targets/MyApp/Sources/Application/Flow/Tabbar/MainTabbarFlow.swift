import RxFlow
import RxRelay
import RxSwift
import UIKit

struct MainTabbarStepper: Stepper {
    let steps: PublishRelay<Step> = .init()

    var initialStep: Step {
        return KOStep.matchListIsRequired
    }
}

final class MainTabbarFlow: Flow {
    // MARK: - Properties
    var root: Presentable {
        return self.rootVC
    }

    let stepper: MainTabbarStepper = .init()
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
    
}
