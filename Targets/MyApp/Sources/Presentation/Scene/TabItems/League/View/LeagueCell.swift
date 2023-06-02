import UIKit
import Then
import SnapKit
import RxSwift

final class LeagueCell: BaseTableViewCell<All> {
    
    static let identifier = "LeagueCellIdentifier"
    
    private let teamNameLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.textColor = .black
        $0.sizeToFit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        model = nil
    }
    
    override func addView() {
        contentView.addSubview(teamNameLabel)
    }
    
    override func setLayout() {
        teamNameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(10)
        }
    }
    
    override func bind(_ model: All) {
        teamNameLabel.text = model.shortName
    
    }
}
