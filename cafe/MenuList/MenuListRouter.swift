import UIKit

protocol MenuListRouterProtocol: RouterProtocol {
    func openReceipt(items: [MenuListViewModel.MenuItem])
}

class MenuListRouter {
    weak var host: UIViewController?

    init(host hostVC: UIViewController) {
        host = hostVC
    }
}

extension MenuListRouter: MenuListRouterProtocol {
    func openReceipt(items: [MenuListViewModel.MenuItem]) {
        guard let hostVC = host else { return }
        let receipt = ReceiptModule.entry(items: items)
        PushTransition(viewController: hostVC).open(to: receipt)
    }
}
