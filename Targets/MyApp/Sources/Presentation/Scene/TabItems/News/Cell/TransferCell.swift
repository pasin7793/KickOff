import UIKit
import SnapKit
import Then
import Kingfisher

final class TransferCell: UITableViewCell {
    static let identifier = "NewsTableViewCell"
    
    private let playerImageView = UIImageView().then{
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 25
        $0.backgroundColor = UIColor.lightGray
    }
    
    private let positionView = UILabel().then{
        $0.layer.cornerRadius = 9
        $0.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        $0.textColor = UIColor.gray
        $0.textAlignment = .center
        $0.sizeToFit()
    }
    
    private let playerLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 11, weight: .bold)
        $0.textColor = .darkGray
        $0.sizeToFit()
    }
    
    private let transImageView = UIImageView(image: UIImage(systemName: "arrow.forward.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.systemGreen))
    
    private let toLogoImageView = UIImageView().then{
        $0.layer.masksToBounds = true
    }
    
    private let fromLogoImageView = UIImageView().then{
        $0.layer.masksToBounds = true
    }
    
    private let toTeamLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .black
        $0.sizeToFit()
    }
    
    private let fromTeamLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .black
        $0.sizeToFit()
    }
    
    private let marketValueLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        $0.textColor = .darkGray
        $0.sizeToFit()
    }
    
    private let feeLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        $0.textColor = .darkGray
        $0.sizeToFit()
    }
    
    private var contractDateLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 11, weight: .medium)
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
        contentView.addSubViews(playerImageView, positionView, playerLabel,transImageView, toLogoImageView,fromLogoImageView,toTeamLabel, fromTeamLabel,marketValueLabel,feeLabel, contractDateLabel)
    }
        
    private func setLayout() {
        playerImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
            make.size.equalTo(50)
        }
        
        positionView.snp.makeConstraints { make in
            make.top.equalTo(playerImageView.snp.bottom).offset(2)
            make.centerX.equalTo(playerImageView)
            make.width.equalTo(30)
            make.height.equalTo(18)
        }
        
        playerLabel.snp.makeConstraints { make in
            make.centerX.equalTo(positionView)
            make.top.equalTo(positionView.snp.bottom).offset(7)
        }
        
        transImageView.snp.makeConstraints { make in
            make.centerX.equalTo(playerLabel)
            make.top.equalTo(playerLabel.snp.bottom).offset(7)
            make.size.equalTo(20)
        }
        
        toLogoImageView.snp.makeConstraints { make in
            make.centerY.equalTo(transImageView)
            make.right.equalTo(transImageView.snp.left).offset(-5)
            make.size.equalTo(20)
        }
        
        fromLogoImageView.snp.makeConstraints { make in
            make.centerY.equalTo(transImageView)
            make.left.equalTo(transImageView.snp.right).offset(5)
            make.size.equalTo(20)
        }
        
        toTeamLabel.snp.makeConstraints { make in
            make.centerY.equalTo(toLogoImageView)
            make.right.equalTo(toLogoImageView.snp.left).offset(-10)
        }
        
        fromTeamLabel.snp.makeConstraints { make in
            make.centerY.equalTo(fromLogoImageView)
            make.left.equalTo(fromLogoImageView.snp.right).offset(10)
        }
        
        marketValueLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
        }
        
        feeLabel.snp.makeConstraints { make in
            make.top.equalTo(transImageView.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(110)
        }
        
        contractDateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(feeLabel)
            make.left.equalTo(feeLabel.snp.right).offset(50)
        }
    }
    
    func bindData(with model: TransferList){
        DispatchQueue.main.async { [weak self] in
            self?.playerImageView.kf.setImage(with: URL(string: "https://images.fotmob.com/image_resources/playerimages/\(model.playerId ?? 0).png"))
            self?.positionView.text = model.position?.label
            self?.playerLabel.text = model.name
            self?.toLogoImageView.kf.setImage(with: URL(string: "https://images.fotmob.com/image_resources/logo/teamlogo/\(model.toClubId ?? 0).png"))
            self?.fromLogoImageView.kf.setImage(with: URL(string: "https://images.fotmob.com/image_resources/logo/teamlogo/\(model.fromClubId ?? 0).png"))
            self?.toTeamLabel.text = model.toClub
            self?.fromTeamLabel.text = model.fromClub
            self?.marketValueLabel.text = "시장 가치 \(model.marketValue ?? "")"
            if model.transferType.text == "contract"{
                self?.feeLabel.text = "\(model.fee?.value ?? "")"
            } else if model.transferType.text == "on loan"{
                self?.feeLabel.text = "\(model.fee?.feeText ?? "")"
            }
            self?.contractDateLabel.text = "계약 \((model.toDate ?? "") + "-" + (model.fromDate ?? ""))"
        }
    }
}
