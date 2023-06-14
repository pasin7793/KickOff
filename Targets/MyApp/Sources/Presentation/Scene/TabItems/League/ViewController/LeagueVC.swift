
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
    
    private let headerView = UIView().then{
        $0.backgroundColor = UIColor(red: 0.9294, green: 0.9294, blue: 0.9294, alpha: 1.0)
        $0.layer.cornerRadius = 10
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    //MARK: - Label in header
    private let rankLabel = UILabel().then{
        $0.text = "순위"
        $0.font = UIFont.systemFont(ofSize: 9, weight: .medium)
        $0.textColor = .black
        $0.sizeToFit()
    }
    
    private let teamNameLabel = UILabel().then{
        $0.text = "팀"
        $0.font = UIFont.systemFont(ofSize: 9, weight: .medium)
        $0.textColor = .black
        $0.sizeToFit()
    }
    
    private let playTimesLabel = UILabel().then{
        $0.text = "경기"
        $0.font = UIFont.systemFont(ofSize: 9, weight: .medium)
        $0.textColor = .black
        $0.sizeToFit()
    }
    
    private let winsLabel = UILabel().then{
        $0.text = "승"
        $0.font = UIFont.systemFont(ofSize: 9, weight: .medium)
        $0.textColor = .black
        $0.sizeToFit()
    }
    
    private let drawsLabel = UILabel().then{
        $0.text = "무"
        $0.font = UIFont.systemFont(ofSize: 9, weight: .medium)
        $0.textColor = .black
        $0.sizeToFit()
    }
    
    private let lossesLabel = UILabel().then{
        $0.text = "패"
        $0.font = UIFont.systemFont(ofSize: 9, weight: .medium)
        $0.textColor = .black
        $0.sizeToFit()
    }
    
    private let dgLabel = UILabel().then{
        $0.text = "득실"
        $0.font = UIFont.systemFont(ofSize: 9, weight: .medium)
        $0.textColor = .black
        $0.sizeToFit()
    }
    
    private let pointsLabel = UILabel().then{
        $0.text = "승점"
        $0.font = UIFont.systemFont(ofSize: 9, weight: .medium)
        $0.textColor = .black
        $0.sizeToFit()
    }
    
    private let league1TableView = UITableView().then{
        $0.rowHeight = 50
        $0.register(LeagueCell.self, forCellReuseIdentifier: LeagueCell.identifier)
        $0.separatorStyle = .singleLine
        $0.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    private let league2TableView = UITableView().then{
        $0.rowHeight = 50
        $0.register(LeagueCell.self, forCellReuseIdentifier: LeagueCell.identifier)
        $0.separatorStyle = .singleLine
        $0.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    override func configureNavigation() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "리그"
    }
    
    override func addView() {
        view.addSubViews(segmentedControl, headerView ,league2TableView, league1TableView)
        headerView.addSubViews(rankLabel,teamNameLabel, playTimesLabel,winsLabel,drawsLabel,lossesLabel, dgLabel, pointsLabel)
    }
    
    override func setLayout() {
        
        segmentedControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview().inset(10)
        }
        
        headerView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(30)
        }
        
        league1TableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom)
        }
        
        league2TableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom)
        }
        
        rankLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(15)
        }
        
        teamNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(rankLabel)
            make.left.equalTo(rankLabel.snp.right).offset(85)
        }
        
        playTimesLabel.snp.makeConstraints { make in
            make.centerY.equalTo(teamNameLabel)
            make.left.equalTo(teamNameLabel.snp.right).offset(60)
        }
        
        winsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(playTimesLabel)
            make.left.equalTo(playTimesLabel.snp.right).offset(12)
        }
        
        drawsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(winsLabel)
            make.left.equalTo(winsLabel.snp.right).offset(12)
        }
        
        lossesLabel.snp.makeConstraints { make in
            make.centerY.equalTo(drawsLabel)
            make.left.equalTo(drawsLabel.snp.right).offset(12)
        }
        
        dgLabel.snp.makeConstraints { make in
            make.centerY.equalTo(lossesLabel)
            make.left.equalTo(lossesLabel.snp.right).offset(22)
        }
        
        pointsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(dgLabel)
            make.left.equalTo(dgLabel.snp.right).offset(34)
        }
    }
    
    override func setup() {
        viewModel.delegate = self
        leagueData.bind(to: league1TableView.rx.items(cellIdentifier: LeagueCell.identifier, cellType: LeagueCell.self)){
            (row, data, cell) in
            cell.bindData(with: data)
        }.disposed(by: disposeBag)
        
        league1TableView.rx.modelSelected(LeagueList.self)
            .subscribe(onNext: { item in
                self.viewModel.pushToDetail(model: item)
            }).disposed(by: disposeBag)
        
        viewModel.delegate2 = self
        league2Data.bind(to: league2TableView.rx.items(cellIdentifier: LeagueCell.identifier, cellType: LeagueCell.self)){
            (row, data, cell) in
            cell.bindData(with: data)
         }.disposed(by: disposeBag)
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
