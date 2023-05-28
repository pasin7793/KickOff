
import UIKit
import SnapKit
import RxSwift
import RxCocoa
import Tabman
import ReactorKit
import Pageboy
import Lottie
import Kingfisher

final class MainTabbarVC: TabmanViewController, View {
    
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
    
    public func setViewControllers(_ vcs: [UIViewController]) {
        self.viewControllers = vcs
        self.dataSource = self

        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        bar.layout.interButtonSpacing = 90
        bar.buttons.customize {
            $0.font = UIFont.systemFont(ofSize: 15)
            $0.tintColor = .red
            $0.selectedFont = UIFont.systemFont(ofSize: 15)
            $0.selectedTintColor = UIColor(red: 0, green: 0.65, blue: 1, alpha: 0.99)
        }
        bar.indicator.weight = .custom(value: 2)
        bar.indicator.cornerStyle = .rounded
        bar.layout.alignment = .centerDistributed
        bar.systemBar().backgroundStyle = .clear
        addBar(bar, dataSource: self, at: .bottom)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        addView()
        setLayout()
        configNavigation()
    }
    
    func bind(reactor: MainTabbarReactor) {
        bindAction(reactor: reactor)
        bindView(reactor: reactor)
        bindState(reactor: reactor)
    }
    
    func setup() {
        
    }
    func addView() {
       
    }
    func setLayout() {
        
    }
    func configNavigation() {
        
    }
    
    func bindAction(reactor: MainTabbarReactor){
        
    }
    
    func bindView(reactor: MainTabbarReactor){
        
    }
    
    func bindState(reactor: MainTabbarReactor){
        
    }
}

extension MainTabbarVC: PageboyViewControllerDataSource, TMBarDataSource {
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
