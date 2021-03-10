import UIKit

protocol TableViewModel {
    var output: TableViewModelOutput? { get set }
    
    func numberOfSections() -> Int
    
    func numberOfItems(inSection section: Int) -> Int

    func viewModelForItem(at indexPath: IndexPath) -> ViewModel?
}

extension TableViewModel {
    func numberOfSections() -> Int {
        return 1
    }
}

protocol TableViewModelOutput: class {
    func viewModelChanged(_ vm: TableViewModel)
    func viewModelChanged(_ viewModel: TableViewModel, didChangeItemsAt indexPaths: [IndexPath])
}

extension TableViewModelOutput {
    func viewModelChanged(_ viewModel: TableViewModel, didChangeItemsAt indexPaths: [IndexPath]) {}
}
