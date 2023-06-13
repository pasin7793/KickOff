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
        contentView.addSubViews(playerImageView, positionView, playerLabel)
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
    }
    
    func bindData(with model: TransferList){
        DispatchQueue.main.async { [weak self] in
            self?.playerImageView.kf.setImage(with: URL(string: "https://images.fotmob.com/image_resources/playerimages/\(model.playerId ?? 0).png"))
            self?.positionView.text = model.position?.label
            self?.playerLabel.text = model.name
        }
    }
}
