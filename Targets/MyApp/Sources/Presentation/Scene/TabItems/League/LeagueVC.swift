
import RxSwift
import UIKit
import Then
import SnapKit
import RxDataSources

final class LeagueVC: BaseVC<LeagueViewModel> {
    
    private let leagueListTableView = UITableView(frame: .zero, style: .plain).then {
        $0.register(LeagueCell.self, forCellReuseIdentifier: LeagueCell.identifier)
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 200
        $0.showsVerticalScrollIndicator = false
        $0.backgroundColor = .white
    }
    
    override func configureNavigation() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "리그"
    }
    
    override func addView() {
        view.addSubview(leagueListTableView)
    }
    
    override func setLayout() {
        leagueListTableView.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
