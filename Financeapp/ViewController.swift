import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	private let items: [FinaneDashboardItem] = [
		FinaneDashboardItem.totalAmount("$9,512.00"),
		FinaneDashboardItem.accountDetails([
			AccountDetailItem(title: "Some item"),
			AccountDetailItem(title: "Some item"),
			AccountDetailItem(title: "Some item"),
			AccountDetailItem(title: "Some item"),
			AccountDetailItem(title: "Some item"),
			AccountDetailItem(title: "Some item"),
			AccountDetailItem(title: "Some item")
		]),
		FinaneDashboardItem.recent
	]

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.register(cellType: TotalAmountCell.self)
		tableView.register(cellType: AccountDetailsCell.self)
		tableView.register(cellType: RecentCell.self)
		tableView.reloadData()
		setupNavBar()
	}


	func setupNavBar() {
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
		self.navigationController?.navigationBar.shadowImage = UIImage()
		self.navigationController?.navigationBar.isTranslucent = true
		self.navigationController?.view.backgroundColor = .clear
		self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.init(named: "finBlueLight")!]
		let navItem = UINavigationItem(title: "Total balance");
		let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.camera, target: self, action: nil);
		navItem.rightBarButtonItem = doneItem;
		self.navigationController?.navigationBar.setItems([navItem], animated: true);
	}
}

enum FinaneDashboardItem {
	case totalAmount(String)
	case accountDetails([AccountDetailItem])
	case recent
}

extension ViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch items[indexPath.row] {
		case .totalAmount:
			let cell: TotalAmountCell = tableView.dequeueReusableCell(for: indexPath)
			return cell
		case .accountDetails(let items):
			let cell: AccountDetailsCell = tableView.dequeueReusableCell(for: indexPath)
			cell.items = items
			return cell
		case .recent:
			let cell: RecentCell = tableView.dequeueReusableCell(for: indexPath)
			cell.items = 5
			return cell
		}
	}
}
