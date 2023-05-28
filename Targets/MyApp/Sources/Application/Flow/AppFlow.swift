
import RxFlow
import RxRelay
import RxSwift
import UIKit

struct AppStepper: Stepper{
    let steps: PublishRelay<Step> = .init()
    private let disposeBag: DisposeBag = .init()
    
    func readyToEmitSteps() {
        Observable.just(KOStep.matchListIsRequired)
            .bind(to: steps)
            .disposed(by: disposeBag)
    }
}

final class AppFlow: Flow{
    
    // MARK: - Properties
    var root: Presentable{
        return self.rootVC
    }
    
    private lazy var rootVC: UIViewController = {
        let launchScreenStoryboard = UIStoryboard(name: "LaunchScreen", bundle: nil)
        let launchScreen = launchScreenStoryboard.instantiateViewController(withIdentifier: "LaunchScreen")
        return launchScreen
    }()
    
    // MARK: - Init
    
    init(){
    }
    
    deinit{
        print("\(type(of: self)): \(#function)")
    }
    
    // MARK: - Navigate
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step.asKOStep else { return .none }
        switch step{
        case .matchListIsRequired:
            return coordinateMatchList()
        default:
            return .none
        }
    }
}

// MARK: - Method
private extension AppFlow{
    func coordinateMatchList() -> FlowContributors {
        let flow = MainTabbarFlow()
        Flows.use(
            flow,
            when: .created
        ) { [unowned self] root in
            DispatchQueue.main.async {
                self.rootVC.dismiss(animated: false)
                self.rootVC.present(root, animated: true)
            }
        }
        return .one(flowContributor: .contribute(withNextPresentable: flow,
                                                 withNextStepper: OneStepper(withSingleStep:
                                                                                KOStep.matchListIsRequired)))
    }
}

