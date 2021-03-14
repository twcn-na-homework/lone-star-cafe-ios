import UIKit

protocol ReceiptRouterProtocol: RouterProtocol {
  func showDiscountOptions()
}

class ReceiptRouter: ReceiptRouterProtocol {
    weak var host: UIViewController?

    func showDiscountOptions() {
        let actionSheet = UIAlertController(title: "Discount", message: "Please choose a discount type", preferredStyle: .actionSheet)
        let percentage = UIAlertAction(title: "Percentage", style: .default, handler: nil)
        let amount = UIAlertAction(title: "Amount", style: .default, handler: nil)
        let dismiss = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)

        actionSheet.addAction(percentage)
        actionSheet.addAction(amount)
        actionSheet.addAction(dismiss)

        host?.present(actionSheet, animated: true, completion: nil)
    }
}
