
import RxSwift
import UIKit
import Then
import SnapKit
import RxDataSources

final class LeagueVC: BaseVC<LeagueViewModel>, LeagueProtocol{
    
    var leagueData = BehaviorSubject<[League]>(value: [])
    var league2Data = BehaviorSubject<[League]>(value: [])
    
    private let segmentedControl = UISegmentedControl(items: ["K리그1", "K리그2"]).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(switchView), for: .valueChanged)
        $0.selectedSegmentIndex = 0
    }
    
    private let league1TableView = UITableView().then{
        $0.rowHeight = 50
        $0.register(League1Cell.self, forCellReuseIdentifier: League1Cell.identifier)
        $0.separatorStyle = .singleLine
        $0.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    private let league2TableView = UITableView().then{
        $0.rowHeight = 50
        $0.register(League2Cell.self, forCellReuseIdentifier: League2Cell.identifier)
        $0.separatorStyle = .singleLine
        $0.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
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
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(segmentedControl.snp.bottom)
        }
    }
    
    override func setup() {
        viewModel.delegate = self
        leagueData.bind(to: league1TableView.rx.items(cellIdentifier: League1Cell.identifier, cellType: League1Cell.self)){
            (row, data, cell) in
            cell.bindData(with: data)
        }.disposed(by: disposeBag)
        
        viewModel.delegate2 = self
        /*league2Data.bind(to: league2TableView.rx.items(cellIdentifier: League2Cell.identifier, cellType: League2Cell.self)){
            (row, data, cell) in
            cell.bindData(with: data)
         }.disposed(by: disposeBag)*/
        league2TableView.delegate = self
        league2TableView.dataSource = self
        viewModel.getLeague2 { _ in
            self.league2TableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getLeague1 { _ in
            DispatchQueue.main.async {
                self.league1TableView.reloadData()
            }
        }
        
        viewModel.getLeague2 { _ in
            DispatchQueue.main.async {
                self.league2TableView.reloadData()
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

extension LeagueVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: League2Cell.identifier, for: indexPath) as! League2Cell
        cell.bindData(with: viewModel.league2Data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.league2Data.count
    }
}
