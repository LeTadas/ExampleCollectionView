import Foundation
import Reusable

class AccountDetailsItemCell: UICollectionViewCell, NibReusable {

	@IBOutlet weak var background: UIView!
	var color: UIColor = UIColor.black {
		didSet {
			self.background.backgroundColor = color
		}
	}
}
