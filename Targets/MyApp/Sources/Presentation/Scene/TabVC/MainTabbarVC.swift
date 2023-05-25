
import UIKit

final class MainTabbarVC: UITabBarController {
    // MARK: - Init
    init() {
        super.init(nibName: nil, bundle: nil)
        configureVC()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - UI
private extension MainTabbarVC {
    func configureVC() {
        UITabBar.clearShadow()
        tabBar.backgroundColor = .white
        tabBar.layer.applyShadow(
            color: MOIZAAsset.moizaGray6.color,
            offSet: .init(width: 0, height: 0),
            blur: 12)
    }
}
