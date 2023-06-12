
import RxSwift
import RxCocoa
import UIKit
import Then
import SnapKit
import RxDataSources

final class MatchVC: BaseVC<MatchViewModel>, MatchProtocol{
    var matchData = BehaviorSubject<[Match]>(value: [])
    
    private let matchTableView = UITableView().then{
        $0.rowHeight = 50
        $0.register(MatchCell.self, forCellReuseIdentifier: MatchCell.identifier)
        $0.separatorStyle = .singleLine
        $0.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    override func setup() {
        viewModel.delegate = self
        matchData.bind(to: matchTableView.rx.items(cellIdentifier: MatchCell.identifier, cellType: MatchCell.self)){
            (row, data, cell) in
            cell.bindData(with: data)
        }.disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getMatch { _ in
            DispatchQueue.main.async {
                self.matchTableView.reloadData()
            }
        }
    }
    
    override func addView() {
        view.addSubViews(matchTableView)
    }
    
    override func setLayout() {
        matchTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
