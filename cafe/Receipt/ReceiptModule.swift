import UIKit

class ReceiptModule {
    static func entry (items: [MenuListViewModel.MenuItem]) -> UIViewController {
        let viewModel = ReceiptViewModel(selectedItems: items)
        let vc = ReceiptViewController()
        let router = ReceiptRouter()

        vc.configure(with: viewModel, router: router)
        router.host = vc
        return vc
    }
}
