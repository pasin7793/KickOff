import UIKit
import SnapKit
import Then
import Kingfisher

final class NewsCell: UITableViewCell {
    static let identifier = "NewsTableViewCell"
    
    private let thumbnailImageView = UIImageView().then{
        $0.layer.cornerRadius = 7
        $0.backgroundColor = UIColor.gray
        $0.layer.masksToBounds = true
    }
    
    private let titleLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        $0.textColor = .black
        $0.sizeToFit()
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 0
    }
    
    private let iconImageView = UIImageView().then{
        $0.layer.masksToBounds = true
    }
    
    private let sourceLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        $0.textColor = .black
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
        contentView.addSubViews(thumbnailImageView, titleLabel, iconImageView, sourceLabel)
    }
        
    private func setLayout() {
        thumbnailImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(15)
            make.height.equalTo(200)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(thumbnailImageView.snp.bottom).offset(10)
            make.width.equalTo(thumbnailImageView)
            make.leading.equalTo(thumbnailImageView)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.size.equalTo(15)
        }
        
        sourceLabel.snp.makeConstraints { make in
            make.centerY.equalTo(iconImageView)
            make.left.equalTo(iconImageView.snp.right).offset(5)
        }
    }
    
    func bindData(with model: NewsData){
        DispatchQueue.main.async { [weak self] in
            self?.thumbnailImageView.kf.setImage(with: URL(string: model.imageUrl))
            self?.titleLabel.text = model.title
            self?.iconImageView.kf.setImage(with: URL(string: model.sourceIconUrl))
            self?.sourceLabel.text = model.sourceStr
        }
    }
}
