import Foundation

typealias MenuModel = FetchMenuItemsQuery.Data.Menu

class MenuListViewModal {
    
    var items: [MenuListItemViewModel] = [] {
        didSet {
            self.output?.viewModelChanged(self)
        }
    }
    weak var output: TableViewModalOutput?
    
    func fetchData()  {
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
        var idx = 0
        self.items = self.items.map {
            if idx == indexPath.item {
                $0.isChecked = !$0.isChecked
            }
            idx += 1
            return $0
        }
    }
    
    private func transform(models: [MenuModel]) -> [MenuListItemViewModel] {
        return models.map { MenuListItemViewModel(model: $0) }
    }
}

extension MenuListViewModal: TableViewModel {
    
    func numberOfItems(inSection section: Int) -> Int {
        return items.count
    }
    
    func viewModelForItem(at indexPath: IndexPath) -> ViewModel? {
        guard indexPath.item < items.count else { return nil }
        return items[indexPath.item]
    }
}


