
import RxSwift
import UIKit
import Then
import SnapKit
import RxDataSources

final class LeagueVC: BaseVC<LeagueViewModel>, LeagueProtocol{
    
    var leagueData = PublishSubject<[League]>()
    
    private let segmentedControl = UISegmentedControl(items: ["K리그1", "K리그2"]).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(switchView), for: .valueChanged)
        $0.selectedSegmentIndex = 0
    }
    
    private let league1TableView = UITableView().then{
        $0.rowHeight = 50
        $0.register(LeagueCell.self, forCellReuseIdentifier: LeagueCell.identifier)
        //$0.separatorStyle = .none
    }
    
    private let league2TableView = UITableView().then{
        $0.backgroundColor = .blue
    }
    
    override func configureNavigation() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "리그"
    }
    
    override func addView() {
        view.addSubViews(segmentedControl, league2TableView, league1TableView)
    }
    
    override func setLayout() {
        
        segmentedControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview().inset(10)
        }
        
        league1TableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(segmentedControl.snp.bottom)
        }
        
        league2TableView.snp.makeConstraints { make in
            make.edges.equalTo(league1TableView)
        }
    }
    
    override func setup() {
        viewModel.delegate = self
        leagueData.bind(to: league1TableView.rx.items(cellIdentifier: LeagueCell.identifier, cellType: LeagueCell.self)){
            (row, data, cell) in
            cell.bindData(with: data)
        }.disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getLeague { _ in
            DispatchQueue.main.async {
                self.league1TableView.reloadData()
            }
        }
    }
    
    @objc func switchView(_ sender: UISegmentedControl){
        let selection = sender.selectedSegmentIndex
        switch selection {
        case 0:
            league1TableView.isHidden = false
            league2TableView.isHidden = true
            
        case 1:
            league1TableView.isHidden = true
            league2TableView.isHidden = false
            
        default: break
        }
    }
}
