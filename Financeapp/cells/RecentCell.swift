import Foundation
import Reusable

class RecentCell: UITableViewCell, NibReusable {

	@IBOutlet weak var holder: UIView!
	
	var items: Int = 0 {
		didSet {
			let stackView = UIStackView()
			stackView.axis = NSLayoutConstraint.Axis.vertical
			stackView.distribution  = UIStackView.Distribution.equalSpacing
			stackView.alignment = UIStackView.Alignment.center
			stackView.spacing   = 8
			stackView.translatesAutoresizingMaskIntoConstraints = false

			for _ in 0...items {
				print("Loops")
				let view = RecentListItem()
				stackView.addArrangedSubview(view)
			}
			holder.addSubview(stackView)
			stackView.centerXAnchor.constraint(equalTo: self.holder.centerXAnchor).isActive = true
			stackView.centerYAnchor.constraint(equalTo: self.holder.centerYAnchor).isActive = true
			layoutSubviews()
		}
	}
}
