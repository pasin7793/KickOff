
import RxSwift
import UIKit
import Then
import SnapKit
import RxDataSources

final class LeagueVC: BaseVC<LeagueViewModel> {
    
    private let segmentedControl = UISegmentedControl(items: ["K리그1", "K리그2"]).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(switchView), for: .valueChanged)
        $0.selectedSegmentIndex = 0
    }
    
    private let league1View = UITableView().then{
        $0.backgroundColor = .red
    }
    
    private let league2View = UITableView().then{
        $0.backgroundColor = .blue
    }
    
    override func configureNavigation() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "리그"
    }
    
    override func addView() {
        view.addSubViews(segmentedControl, league2View, league1View)
    }
    
    override func setLayout() {
        
        segmentedControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview().inset(10)
        }
        
        league1View.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(segmentedControl.snp.bottom)
        }
        
        league2View.snp.makeConstraints { make in
            make.edges.equalTo(league1View)
        }
    }
    
    @objc func switchView(_ sender: UISegmentedControl){
        let selection = sender.selectedSegmentIndex
        switch selection {
        case 0:
            league1View.isHidden = false
            league2View.isHidden = true
            
        case 1:
            league1View.isHidden = true
            league2View.isHidden = false
            
        default: break
        }
    }
}
