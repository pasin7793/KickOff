import UIKit
import SnapKit
import Then
import Kingfisher

final class League1Cell: UITableViewCell {
    static let identifier = "League1TableViewCell"
    
    private let rankLabel = UILabel().then{
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
        contentView.addSubViews(rankLabel)
    }
        
    private func setLayout() {
        rankLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(5)
        }
    }
    
    func bindData(with model: League){
        DispatchQueue.main.async { [weak self] in
            self?.rankLabel.text = "\(model.idx)"
        }
    }
}
