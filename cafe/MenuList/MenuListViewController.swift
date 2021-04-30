import UIKit
import SnapKit

class MenuListViewController: UIViewController {
    private var didUpdateConstrains = false

    var viewModel: (MenuListViewModelInput & TableViewModel)?
    var router: MenuListRouterProtocol?

    private lazy var totalView: TotalPreviewView = {
        let view = TotalPreviewView()
        view.output = self
        return view
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.contentInset = UIEdgeInsets.init(top: 20, left: 0, bottom: 0, right: 0)
        tableView.register(MenuListItem.self, forCellReuseIdentifier: MenuListItem.ident)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel?.fetchMenu()
    }

    override func updateViewConstraints() {
        if (!didUpdateConstrains) {
            didUpdateConstrains = true
            totalView.snp.makeConstraints {
                $0.height.equalTo(70)
                $0.left.equalToSuperview()
                $0.right.equalToSuperview()
                $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            }

            tableView.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.left.equalToSuperview()
                $0.right.equalToSuperview()
                $0.bottom.equalTo(totalView.snp.top)
            }
        }

        super.updateViewConstraints()
    }

    func setupUI() {
        view.addSubview(tableView)
        view.addSubview(totalView)
        view.setNeedsUpdateConstraints()
        title = "Lone Star Cafe"
    }
}

extension MenuListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfItems(inSection: section) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuListItem.ident, for: indexPath)

        if let itemVM = viewModel?.viewModelForItem(at: indexPath),
           let viewable = cell as? MenuListItem {
            viewable.onSelected = { [weak self] _ in
                self?.viewModel?.toggle(at: indexPath)
            }
            viewable.configure(with: itemVM)
        }

        return cell
    }
}

extension MenuListViewController: TotalPreviewViewOutput {
    func onPayClick() {
        guard let vm = viewModel else { return }
        router?.openReceipt(items: vm.selectedItems)
    }
}

// Update View Model
extension MenuListViewController: TableViewModelOutput {
    func viewModelChanged(_ vm: TableViewModel) {
        tableView.reloadData()

        if let totalVM = viewModel?.totalViewModel {
            totalView.configure(with: totalVM)
        }
    }
}

extension MenuListViewController: ConfigurableView {
    func configure(with vm: ViewModel, router: RouterProtocol? = nil) {
        self.viewModel = vm as? MenuListViewModel
        self.router = router as? MenuListRouter
        viewModel?.output = self
    }
}
