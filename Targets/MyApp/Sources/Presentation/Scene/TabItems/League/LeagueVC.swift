
import RxSwift
import UIKit
import Then
import SnapKit

final class LeagueVC: BaseVC<LeagueReactor> {
    
    private let leagueListTableView = UITableView(frame: .zero, style: .plain).then {
        //
        $0.rowHeight = 60
        $0.separatorStyle = .none
        $0.isScrollEnabled = false
        $0.backgroundColor = .white
    }
    
    override func configureNavigation() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "리그"
    }
    
    
}
