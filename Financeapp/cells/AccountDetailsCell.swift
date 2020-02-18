import Foundation
import Reusable

class AccountDetailsCell: UITableViewCell, NibReusable {

	@IBOutlet weak var collectionView: UICollectionView!

	var items: [AccountDetailItem] = [] {
		didSet {
			print("ITEMS LOADED \(items.count)")
			collectionView.reloadData()
		}
	}

	override func layoutSubviews() {
		collectionView.register(cellType: AccountDetailsItemCell.self)
		collectionView.delegate = self
		(collectionView.collectionViewLayout as! UICollectionViewFlowLayout).minimumLineSpacing = 0
	}
}

extension AccountDetailsCell: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		items.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell: AccountDetailsItemCell = collectionView.dequeueReusableCell(for: indexPath)
		cell.color = indexPath.row % 2 == 0 ? UIColor.init(named: "finPinkDarker")! : UIColor.init(named: "finPink")!
		return cell
	}
}

extension AccountDetailsCell: UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
		if indexPath.row % 2 == 0 {
			let hardCodedPadding:CGFloat = 5
			let itemWidth: CGFloat = 200
			let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
			return CGSize(width: itemWidth, height: itemHeight)
		}else {
			let hardCodedPadding:CGFloat = 40
			let itemWidth: CGFloat = 200
			let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
			return CGSize(width: itemWidth, height: itemHeight)
		}
    }
}
