
import UIKit
import SnapKit
import RxSwift
import RxCocoa
import Tabman
import ReactorKit
import Pageboy
import Lottie
import Kingfisher

final class HomeVC: TabmanViewController, View {
    
    
    // MARK: - Properties
    private var viewControllers: [UIViewController] = []
    
    var disposeBag: DisposeBag = .init()

    typealias Reactor = MainTabbarReactor

    init(reactor: MainTabbarReactor?) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(reactor: MainTabbarReactor) {
        bindAction(reactor: reactor)
        bindView(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    func bindAction(reactor: MainTabbarReactor){
        
    }
    
    func bindView(reactor: MainTabbarReactor){
        
    }
    
    func bindState(reactor: MainTabbarReactor){
        
    }
}

extension HomeVC: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return .first
    }
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "", image: UIImage(systemName: "sportscourt.fill")!)
        case 1:
            return TMBarItem(title: "", image: UIImage(systemName: "newspaper.fill")!)
        case 2:
            return TMBarItem(title: "", image: UIImage(systemName: "trophy.fill")!)
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
    }
}
