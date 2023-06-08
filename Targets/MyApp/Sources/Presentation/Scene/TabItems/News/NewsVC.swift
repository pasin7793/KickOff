
import RxSwift
import RxCocoa
import UIKit
import Then
import SnapKit
import RxDataSources

final class NewsVC: BaseVC<NewsViewModel>, NewsProtocol{
    
    var newsData = PublishSubject<[NewsData]>()
    
    private let now = Date()
    private let formatter = DateFormatter().then{
        $0.dateFormat = "M월 d일"
    }
    
    private let newsTableView = UITableView().then{
        $0.rowHeight = UITableView.automaticDimension
        $0.rowHeight = 300
        $0.register(NewsCell.self, forCellReuseIdentifier: NewsCell.identifier)
        $0.separatorStyle = .none
    }
    
    override func configureNavigation() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "\(formatter.string(from: now))"
    }
    
    override func setup() {
        viewModel.delegate = self
        newsData.bind(to: newsTableView.rx.items(cellIdentifier: NewsCell.identifier, cellType: NewsCell.self)) {
            (row, data, cell) in
            cell.bindData(with: data)
        }.disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.getNews { _ in
            DispatchQueue.main.async {
                self.newsTableView.reloadData()
            }
        }
    }
    
    override func addView() {
        view.addSubViews(newsTableView)
    }
    
    override func setLayout() {
        newsTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaInsets)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
