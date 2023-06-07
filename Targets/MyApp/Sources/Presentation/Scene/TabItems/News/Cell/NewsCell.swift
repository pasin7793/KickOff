import UIKit
import SnapKit
import Then
import Kingfisher

class NewsCell: UITableViewCell {
    static let identifier = "NewsTableViewCell"
    
    private let thumbnailImage = UIImageView().then{
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor.gray
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
        contentView.addSubViews(thumbnailImage)
    }
        
    private func setLayout() {
        thumbnailImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.size.equalTo(150)
        }
    }
    
    func bind(with data: NewsData){
        DispatchQueue.main.async {
            if let imageUrl = URL(string: data.imageURL) {
                self.thumbnailImage.kf.setImage(with: imageUrl)
            }
        }
    }
}
