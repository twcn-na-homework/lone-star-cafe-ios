import UIKit
import SnapKit

class MenuListViewController: UIViewController {

    var didUpdateConstrains = false

    private lazy var fixedView: TotalPreviewView = {
        let view = TotalPreviewView()
        view.output = self
        return view
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets.init(top: 20, left: 0, bottom: 0, right: 0)
        tableView.register(MenuListItem.self, forCellReuseIdentifier: MenuListItem.ident)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    var viewModel = MenuListViewModel()
    var router: MenuListRouterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        router = MenuListRouter(host: self)
        self.setupUI()
        self.viewModel.fetchData()
    }

    override func updateViewConstraints() {
        if (!didUpdateConstrains) {
            didUpdateConstrains = true
            fixedView.snp.makeConstraints {
                $0.height.equalTo(70)
                $0.left.equalToSuperview()
                $0.right.equalToSuperview()
                $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            }

            tableView.snp.makeConstraints {
                $0.top.equalToSuperview()
                $0.left.equalToSuperview()
                $0.right.equalToSuperview()
                $0.bottom.equalTo(fixedView.snp.top)
            }
        }

        super.updateViewConstraints()
    }

    func setupUI() {
        view.addSubview(tableView)
        view.addSubview(fixedView)
        view.setNeedsUpdateConstraints()
        viewModel.output = self
    }
}

extension MenuListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(inSection: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuListItem.ident, for: indexPath)

        if let vm = viewModel.viewModelForItem(at: indexPath),
           let viewable = cell as? MenuListItem {

            viewable.configure(with: vm)
            viewable.onSelected = { [weak self] _ in
                self?.viewModel.toggle(at: indexPath)
            }
        }

        return cell
    }
}

extension MenuListViewController: TotalPreviewViewOutput {
    func onPayClick() {
        router.openReceipt()
    }
}

// Update View Model
extension MenuListViewController: TableViewModelOutput {
    func viewModelChanged(_ vm: TableViewModel) {
        tableView.reloadData()
        fixedView.configure(with: viewModel.totalViewModel)
    }
}
