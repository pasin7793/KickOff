import UIKit
import SnapKit
import Then
import Kingfisher

final class MatchCell: UITableViewCell {
    static let identifier = "MatchTableViewCell"
    
    private let homeLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .darkGray
        $0.sizeToFit()
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 0
        $0.textAlignment = .right
    }
    
    private let awayLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .darkGray
        $0.sizeToFit()
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 0
        $0.textAlignment = .left
    }
    
    private let homeLogo = UIImageView().then{
        $0.layer.masksToBounds = true
    }
    
    private let awayLogo = UIImageView().then{
        $0.layer.masksToBounds = true
    }
    
    private let homeScoreLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .darkGray
        $0.sizeToFit()
    }
    
    private let awayScoreLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .darkGray
        $0.sizeToFit()
    }
    
    private let divideLabel = UILabel().then{
        $0.text = "-"
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .darkGray
        $0.sizeToFit()
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
        contentView.addSubViews(homeLabel,awayLabel,homeLogo,awayLogo, homeScoreLabel, awayScoreLabel, divideLabel)
    }
        
    private func setLayout() {
        homeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(40)
            make.width.equalTo(80)
        }
        
        awayLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(-40)
            make.width.equalTo(80)
        }
        
        homeLogo.snp.makeConstraints { make in
            make.centerY.equalTo(homeLabel)
            make.left.equalTo(homeLabel.snp.right).offset(20)
            make.size.equalTo(25)
        }
        
        awayLogo.snp.makeConstraints { make in
            make.centerY.equalTo(awayLabel)
            make.right.equalTo(awayLabel.snp.left).offset(-20)
            make.size.equalTo(25)
        }
        
        homeScoreLabel.snp.makeConstraints { make in
            make.centerY.equalTo(homeLogo)
            make.centerX.equalToSuperview().offset(-13)
        }
        
        awayScoreLabel.snp.makeConstraints { make in
            make.centerY.equalTo(awayLogo)
            make.centerX.equalToSuperview().offset(13)
        }
        
        divideLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func bindData(with model: Match){
        DispatchQueue.main.async { [weak self] in
            self?.homeLabel.text = model.home.longName
            self?.awayLabel.text = model.away.longName
            self?.homeLogo.kf.setImage(with: URL(string: "https://images.fotmob.com/image_resources/logo/teamlogo/\(model.home.id ?? 0).png"))
            self?.awayLogo.kf.setImage(with: URL(string: "https://images.fotmob.com/image_resources/logo/teamlogo/\(model.away.id ?? 0).png"))
            self?.homeScoreLabel.text = "\(model.home.score ?? 0)"
            self?.awayScoreLabel.text = "\(model.away.score ?? 0)"
        }
    }
}
