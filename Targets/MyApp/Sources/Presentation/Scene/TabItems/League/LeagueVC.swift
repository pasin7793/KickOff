
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
    
    private let segmentedControl = UISegmentedControl(items: ["league1View", "league2View"]).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(switchView), for: .touchUpInside)
    }
    
    private let league1View = UIView().then{
        $0.backgroundColor = .red
    }
    
    private let league2View = UIView().then{
        $0.backgroundColor = .blue
    }
    
    override func configureNavigation() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "리그"
    }
    
    override func addView() {
        view.addSubViews(leagueListTableView,segmentedControl, league1View, league2View)
    }
    
    override func setLayout() {
        leagueListTableView.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        segmentedControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(150)
        }
    }
    
    @objc func switchView(_ sender: UISegmentedControl){
        if sender.selectedSegmentIndex == 0 {
            league1View.alpha = 1
            league2View.alpha = 0
        } else{
            league1View.alpha = 0
            league2View.alpha = 1
        }
    }
}
