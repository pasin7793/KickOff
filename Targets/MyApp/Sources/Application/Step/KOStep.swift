import RxFlow
import ReactorKit
import RxSwift
import RxRelay
import UIKit

enum KOStep: Step{
    // Global
    case alert(title: String?, message: String?, style: UIAlertController.Style, actions: [UIAlertAction])
    case errorAlert(title: String?, message: String?)
    case dismiss
    
    //Main
    case mainTabbarIsRequired
    case matchIsRequired
    case newsIsRequired
    case leagueIsRequired
}
