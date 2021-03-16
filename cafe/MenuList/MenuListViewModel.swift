import Foundation

protocol MenuListViewModelInput {
    var totalViewModel: TotalPreviewViewModel { get }
    func fetchMenu()
    func toggle(at indexPath: IndexPath)
    var selectedItems: [MenuListViewModel.MenuItem] { get }
}

class MenuListViewModel {
    typealias MenuItem = FetchMenuItemsQuery.Data.Menu

    weak var output: TableViewModelOutput?

    var numberOfSelected: Int {
        items.filter {
            $0.isChecked
        }.count
    }


    private(set) var items: [MenuListItemViewModel] = [] {
        didSet {
            output?.viewModelChanged(self)
        }
    }
}

/// Mark: - Input Protocol
extension MenuListViewModel: MenuListViewModelInput {
    var totalViewModel: TotalPreviewViewModel {
        let vm = TotalPreviewViewModel()
        vm.numberOfItems = numberOfSelected
        return vm
    }

    var selectedItems: [MenuItem] {
        items.filter {
            $0.isChecked
        }.map { $0.menu! }
    }

    func fetchMenu() {
        Network.shared.apollo.fetch(query: FetchMenuItemsQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                self.items = self.transform(models: graphQLResult.data?.menu ?? [])
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }

    func toggle(at indexPath: IndexPath) {
        let newItems: [MenuListItemViewModel] = items.mapWithIndex { (e, idx) in
            if idx == indexPath.item {
                e.isChecked = !e.isChecked
            }
            return e
        }

        items = newItems
    }

    private func transform(models: [MenuItem]) -> [MenuListItemViewModel] {
        models.map {
            MenuListItemViewModel(model: $0)
        }
    }
}

/// Mark: - TableViewModel Protocol
extension MenuListViewModel: TableViewModel {
    func numberOfItems(inSection section: Int) -> Int {
        items.count
    }

    func viewModelForItem(at indexPath: IndexPath) -> ViewModel? {
        guard indexPath.item < items.count else {
            return nil
        }
        return items[indexPath.item]
    }
}


