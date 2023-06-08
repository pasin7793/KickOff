
import RxSwift
import RxCocoa
import UIKit
import Then
import SnapKit
import RxDataSources

final class NewsVC: BaseVC<NewsViewModel>{
    
    private let now = Date()
    private let formatter = DateFormatter().then{
        $0.dateFormat = "M월 d일"
    }
    
    private let newsTableView = UITableView().then{
        $0.rowHeight = UITableView.automaticDimension
        $0.rowHeight = 250
        $0.register(NewsCell.self, forCellReuseIdentifier: NewsCell.identifier)
    }
    
    override func configureNavigation() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "\(formatter.string(from: now))"
    }
    
    override func setup() {
        newsTableView.delegate = self
        newsTableView.dataSource = self
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

extension NewsVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.newsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.identifier, for: indexPath) as! NewsCell
        cell.bindData(with: viewModel.newsData[indexPath.row])
        return cell
    }
}
