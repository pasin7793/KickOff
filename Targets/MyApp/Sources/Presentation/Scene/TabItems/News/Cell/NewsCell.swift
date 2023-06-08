import UIKit
import SnapKit
import Then
import Kingfisher

final class NewsCell: UITableViewCell {
    static let identifier = "NewsTableViewCell"
    
    private let thumbnailImage = UIImageView().then{
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor.gray
    }
    
    private let titleLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 16)
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
        contentView.addSubViews(thumbnailImage, titleLabel)
    }
        
    private func setLayout() {
        thumbnailImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func bindData(with model: NewsData){
        DispatchQueue.main.async { [weak self] in
            self?.thumbnailImage.kf.setImage(with: URL(string: model.imageUrl))
            self?.titleLabel.text = model.title
        }
    }
}
