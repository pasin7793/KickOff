
import UIKit

extension CALayer {
    func applyShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        offSet: CGSize = .init(width: 0, height: 2),
        blur: CGFloat = 4
    ) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = offSet
        shadowRadius = blur / 2
    }
}
