
import RxSwift
import UIKit
import Then
import SnapKit
import RxDataSources

final class NewsVC: BaseVC<NewsViewModel> {

    private let now = Date()
    private let formatter = DateFormatter().then{
        $0.dateFormat = "M월 d일"
    }
    
    private let newsTableView = UITableView().then{
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 200
        $0.backgroundColor = .white
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureNavigation() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "\(formatter.string(from: now))"
    }
}
