
import RxSwift
import RxCocoa
import UIKit
import Then
import SnapKit
import RxDataSources

final class MatchVC: BaseVC<MatchViewModel> {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getMatch { _ in
            print("asdfasdf")
        }
    }
}
