
import UIKit
import RxCocoa
import RxSwift
import Then
import SnapKit

class BaseVC<T: BaseViewModel>: UIViewController {
    
    let viewModel: T
    var disposeBag = DisposeBag()
    let bounds = UIScreen.main.bounds
    
    init(_ viewModel: T) {
        self.viewModel = viewModel
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bindVM()
        addView()
        setLayout()
        configureVC()
        configureNavigation()
        view.backgroundColor = .white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func setup(){}
    func bindVM(){}
    func addView(){}
    func setLayout(){}
    func configureVC(){}
    func configureNavigation() {}
}
