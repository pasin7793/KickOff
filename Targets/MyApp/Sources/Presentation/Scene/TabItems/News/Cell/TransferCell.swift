import UIKit
import SnapKit
import Then
import Kingfisher

final class TransferCell: UITableViewCell {
    static let identifier = "NewsTableViewCell"
    
    private let playerImageView = UIImageView().then{
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
        contentView.addSubViews(playerImageView)
    }
        
    private func setLayout() {
        playerImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(50)
        }
    }
    
    func bindData(with model: TransferList){
        DispatchQueue.main.async { [weak self] in
            self?.playerImageView.kf.setImage(with: URL(string: "https://images.fotmob.com/image_resources/playerimages/\(model.playerId ?? 0).png"))
        }
    }
}
