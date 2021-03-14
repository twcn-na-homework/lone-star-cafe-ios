import UIKit

protocol MenuListRouterProtocol {
    func openReceipt()
}

class MenuListRouter {
    weak var hostViewController: UIViewController?

    init(host hostVC: UIViewController) {
        hostViewController = hostVC
    }
}

extension MenuListRouter: MenuListRouterProtocol {
    func openReceipt() {
        guard let host = hostViewController else { return }
        let receipt = InvoiceViewController()
        PushTransition(viewController: host).open(to: receipt)
    }
}
