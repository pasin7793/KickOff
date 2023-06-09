import UIKit
import SnapKit
import Then
import Kingfisher

final class League2Cell: UITableViewCell {
    static let identifier = "League2TableViewCell"
    
    private let rankLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        $0.textColor = .black
        $0.sizeToFit()
    }
    
    private let statusView = UIView()
    
    private let logoImageView = UIImageView().then{
        $0.layer.masksToBounds = true
    }
    
    private let teamNameLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .darkGray
        $0.sizeToFit()
        $0.textAlignment = .center
    }
    
    private let playTimesLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .darkGray
        $0.sizeToFit()
        $0.textAlignment = .center
    }
    
    private let winsLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .darkGray
        $0.sizeToFit()
        $0.textAlignment = .center
    }
    
    private let drawsLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .darkGray
        $0.sizeToFit()
        $0.textAlignment = .center
    }
    
    private let lossesLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .darkGray
        $0.sizeToFit()
        $0.textAlignment = .center
    }
    
    private let gdLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .darkGray
        $0.sizeToFit()
        $0.textAlignment = .center
    }
    
    private let totalLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .darkGray
        $0.sizeToFit()
        $0.textAlignment = .center
    }
    
    private let pointsLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .darkGray
        $0.sizeToFit()
        $0.textAlignment = .center
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addView()
        setLayout()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addView() {
        contentView.addSubViews(statusView,rankLabel,logoImageView,teamNameLabel,playTimesLabel,winsLabel,drawsLabel,lossesLabel,gdLabel,totalLabel,pointsLabel)
    }
        
    private func setLayout() {
        statusView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(10)
            make.top.bottom.equalToSuperview().inset(2)
            make.width.equalTo(2)
        }
        
        rankLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(30)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.centerY.equalTo(rankLabel)
            make.left.equalToSuperview().inset(50)
            make.size.equalTo(23)
        }
        
        teamNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(logoImageView)
            make.left.equalTo(logoImageView.snp.right).offset(10)
        }
        
        playTimesLabel.snp.makeConstraints { make in
            make.centerY.equalTo(teamNameLabel)
            make.left.equalToSuperview().inset(200)
        }
        
        winsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(playTimesLabel)
            make.left.equalToSuperview().inset(220)
        }
        
        drawsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(winsLabel)
            make.left.equalToSuperview().inset(240)
        }
        
        lossesLabel.snp.makeConstraints { make in
            make.centerY.equalTo(drawsLabel)
            make.left.equalToSuperview().inset(260)
        }
        
        gdLabel.snp.makeConstraints { make in
            make.centerY.equalTo(lossesLabel)
            make.left.equalToSuperview().inset(280)
        }
        
        totalLabel.snp.makeConstraints { make in
            make.centerY.equalTo(gdLabel)
            make.left.equalToSuperview().inset(330)
        }
        
        pointsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(totalLabel)
            make.left.equalToSuperview().inset(357)
        }
    }
    
    func bindData(with model: League){
        DispatchQueue.main.async { [weak self] in
            self?.statusView.backgroundColor = UIColor(hex: model.qualColor ?? "")
            self?.rankLabel.text = "\(model.idx)"
            self?.logoImageView.kf.setImage(with: URL(string: "https://images.fotmob.com/image_resources/logo/teamlogo/\(model.id).png"))
            self?.teamNameLabel.text = model.name
            self?.playTimesLabel.text = "\(model.played)"
            self?.winsLabel.text = "\(model.wins)"
            self?.drawsLabel.text = "\(model.draws)"
            self?.lossesLabel.text = "\(model.losses)"
            self?.gdLabel.text = "\(model.scoresStr ?? "")"
            self?.totalLabel.text = "\(model.goalConDiff)"
            self?.pointsLabel.text = "\(model.pts)"
        }
    }
}
