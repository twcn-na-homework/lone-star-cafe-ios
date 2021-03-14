import UIKit

protocol RouterProtocol {
    var host: UIViewController? { get }
}

protocol MenuListRouterProtocol: RouterProtocol {
    func openReceipt()
}

class MenuListRouter {
    weak var host: UIViewController?

    init(host hostVC: UIViewController) {
        host = hostVC
    }
}

extension MenuListRouter: MenuListRouterProtocol {
    func openReceipt() {
        guard let hostVC = host else { return }
        let receipt = InvoiceViewController()
        PushTransition(viewController: hostVC).open(to: receipt)
    }
}
