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
    case matchListIsRequired
    case detailMatchIsRequired(id: Int)
    case newsListIsRequired
    case leagueListIsRequired
    case detailLeagueIsRequired(id: Int)
}
