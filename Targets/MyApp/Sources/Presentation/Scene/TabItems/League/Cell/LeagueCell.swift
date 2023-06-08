import UIKit
import SnapKit
import Then
import Kingfisher

final class LeagueCell: UITableViewCell {
    static let identifier = "LeagueTableViewCell"
    
    private let rankLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        $0.textColor = .black
        $0.sizeToFit()
    }
    
    private let logoImageView = UIImageView().then{
        $0.layer.masksToBounds = true
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
        contentView.addSubViews(rankLabel,logoImageView)
    }
        
    private func setLayout() {
        rankLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(30)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.centerY.equalTo(rankLabel)
            make.left.equalToSuperview().inset(50)
            make.size.equalTo(23)
        }
    }
    
    func bindData(with model: League){
        DispatchQueue.main.async { [weak self] in
            self?.rankLabel.text = "\(model.idx)"
            self?.logoImageView.kf.setImage(with: URL(string: "https://images.fotmob.com/image_resources/logo/teamlogo/\(model.id).png"))
        }
    }
}
