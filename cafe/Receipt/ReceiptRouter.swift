import UIKit

protocol ReceiptRouterProtocol: RouterProtocol {
    func showDiscountOptions(title: String?)
}

class ReceiptRouter: ReceiptRouterProtocol {
    weak var host: UIViewController?

    func showDiscountOptions(title: String?) {

    }
}


