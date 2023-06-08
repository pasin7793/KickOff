
import RxSwift
import UIKit
import Then
import SnapKit
import RxDataSources

final class LeagueVC: BaseVC<LeagueViewModel> {
    
    private let segmentedControl = UISegmentedControl(items: ["K리그1", "K리그2"]).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(switchView), for: .touchUpInside)
        $0.selectedSegmentIndex = 0
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
        view.addSubViews(segmentedControl, league1View, league2View)
    }
    
    override func setLayout() {
        
        segmentedControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(150)
            make.width.equalToSuperview().inset(10)
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
