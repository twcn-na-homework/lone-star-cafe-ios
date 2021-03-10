import UIKit

protocol TableViewModel {
    var output: TableViewModalOutput? { get set }
    
    func numberOfSections() -> Int
    
    func numberOfItems(inSection section: Int) -> Int

    func viewModelForItem(at indexPath: IndexPath) -> ViewModel?
}

extension TableViewModel {
    func numberOfSections() -> Int {
        return 1
    }
}

protocol TableViewModalOutput: class {
    func viewModelChanged(_ vm: TableViewModel)
    func viewModelChanged(_ viewModel: TableViewModel, didChangeItemsAt indexPaths: [IndexPath])
}

extension TableViewModalOutput {
    func viewModelChanged(_ viewModel: TableViewModel, didChangeItemsAt indexPaths: [IndexPath]) {}
}
