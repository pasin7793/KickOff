
import RxSwift
import RxCocoa
import UIKit
import Then
import SnapKit
import RxDataSources

final class NewsVC: BaseVC<NewsViewModel>, NewsProtocol, TransferProtocol{
    
    var newsData = PublishSubject<[NewsData]>()
    var transferData = PublishSubject<[TransferList]>()
    
    private let now = Date()
    private let formatter = DateFormatter().then{
        $0.dateFormat = "M월 d일"
    }
    
    private let segmentedControl = UISegmentedControl(items: ["소식", "이적"]).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(switchView), for: .valueChanged)
        $0.selectedSegmentIndex = 0
    }
    
    private let newsTableView = UITableView().then{
        $0.rowHeight = 300
        $0.register(NewsCell.self, forCellReuseIdentifier: NewsCell.identifier)
        $0.separatorStyle = .none
    }
    
    private let transferTableView = UITableView().then{
        $0.rowHeight = 200
        $0.register(TransferCell.self, forCellReuseIdentifier: TransferCell.identifier)
        $0.separatorStyle = .singleLine
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
        
        viewModel.transferDelegate = self
        transferData.bind(to: transferTableView.rx.items(cellIdentifier: TransferCell.identifier, cellType: TransferCell.self)){
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
        self.viewModel.getTransfer { _ in
            DispatchQueue.main.async {
                self.transferTableView.reloadData()
            }
        }
    }
    
    override func addView() {
        view.addSubViews(transferTableView,newsTableView, segmentedControl)
    }
    
    override func setLayout() {
        segmentedControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview().inset(10)
        }
        newsTableView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        transferTableView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    @objc func switchView(_ sender: UISegmentedControl){
        let selection = sender.selectedSegmentIndex
        switch selection {
        case 0:
            newsTableView.isHidden = false
            transferTableView.isHidden = true
            
        case 1:
            newsTableView.isHidden = true
            transferTableView.isHidden = false
        default: break
        }
    }
}
