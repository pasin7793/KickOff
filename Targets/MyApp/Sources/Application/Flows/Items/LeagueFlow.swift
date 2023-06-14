
import RxFlow
import UIKit
import RxCocoa
import RxSwift

struct LeagueStepper: Stepper{
    var steps = PublishRelay<Step>()

    var initialStep: Step{
        return KOStep.leagueIsRequired
    }
}

class LeagueFlow: Flow {

    var root: Presentable {
        return self.rootViewController
    }
    
    var stepper = LeagueStepper()
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()

    init(){}
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? KOStep else { return .none }
        switch step {
        case .leagueIsRequired:
            return leagueIsRequired()
            
        case let .deatilLeagueIsRequired(id):
            return detailLeagueIsRequired(id: id)
        
        default:
            return .none
        }
    }
    
    private func leagueIsRequired() -> FlowContributors{
        let vm = LeagueViewModel()
        let vc = LeagueVC(vm)
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
    
    private func detailLeagueIsRequired(id: Int) -> FlowContributors{
        let vm = DetailLeagueVM(leagueId: id)
        let vc = DetailLeagueVC(vm)
        self.rootViewController.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vm))
    }
}
