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
    }
    
    private let awayLabel = UILabel().then{
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
        contentView.addSubViews(homeLabel,awayLabel)
    }
        
    private func setLayout() {
        homeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
        }
        
        awayLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(-20)
        }
    }
    
    func bindData(with model: Match){
        DispatchQueue.main.async { [weak self] in
            self?.homeLabel.text = model.home.longName
            self?.awayLabel.text = model.away.longName
        }
    }
}
