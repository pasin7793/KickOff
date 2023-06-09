import UIKit
import SnapKit
import Then
import Kingfisher

final class LeagueCell: UITableViewCell {
    static let identifier = "League1TableViewCell"
    
    private let rankLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        $0.textColor = .black
    }
    
    private let statusView = UIView()
    
    private let logoImageView = UIImageView().then{
        $0.layer.masksToBounds = true
    }
    
    private let teamNameLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .darkGray
        $0.textAlignment = .center
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 0
    }
    
    private let playTimesLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .darkGray
        $0.textAlignment = .center
    }
    
    private let winsLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .darkGray
        $0.textAlignment = .center
    }
    
    private let drawsLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .darkGray
        $0.textAlignment = .center
    }
    
    private let lossesLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .darkGray
        $0.textAlignment = .center
    }
    
    private let gdLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .darkGray
        $0.textAlignment = .center
    }
    
    private let pointsLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        $0.textColor = .darkGray
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
        contentView.addSubViews(statusView,rankLabel,logoImageView,teamNameLabel,playTimesLabel,winsLabel,drawsLabel,lossesLabel,gdLabel,pointsLabel)
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
            make.width.equalTo(100)
        }
        
        playTimesLabel.snp.makeConstraints { make in
            make.centerY.equalTo(teamNameLabel)
            make.left.equalToSuperview().inset(195)
        }
        
        winsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(playTimesLabel)
            make.left.equalToSuperview().inset(215)
            make.width.equalTo(20)
        }
        
        drawsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(winsLabel)
            make.left.equalToSuperview().inset(235)
            make.width.equalTo(20)
        }
        
        lossesLabel.snp.makeConstraints { make in
            make.centerY.equalTo(drawsLabel)
            make.left.equalToSuperview().inset(255)
            make.width.equalTo(20)
        }
        
        gdLabel.snp.makeConstraints { make in
            make.centerY.equalTo(lossesLabel)
            make.left.equalToSuperview().inset(280)
            make.width.equalTo(40)
        }
        
        pointsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(gdLabel)
            make.left.equalToSuperview().inset(337)
            make.width.equalTo(25)
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
            self?.pointsLabel.text = "\(model.pts)"
        }
    }
}
