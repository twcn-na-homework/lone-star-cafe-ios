import UIKit

protocol ReceiptRouterProtocol: RouterProtocol {
  func showDiscountOptions(title: String?)
}

class ReceiptRouter: ReceiptRouterProtocol {
    weak var host: UIViewController?

    var output: DiscountTypeSelectOutput? {
        return host as? ReceiptViewController
    }

    func showDiscountOptions(title: String?) {
        let actionSheet = UIAlertController(title: "Select Discount Type", message: title, preferredStyle: .actionSheet)
        let percentage = UIAlertAction(title: "Percentage", style: .default) { [weak self] _ in
            self?.output?.onSelectChanged(state: .percentage)
        }
        let none = UIAlertAction(title: "No Discount", style: .default) { [weak self] _ in
            self?.output?.onSelectChanged(state: .none)
        }
        let amount = UIAlertAction(title: "Amount", style: .default) { [weak self] _ in
            self?.output?.onSelectChanged(state: .amount)
        }
        let dismiss = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)

        actionSheet.addAction(percentage)
        actionSheet.addAction(amount)
        actionSheet.addAction(none)
        actionSheet.addAction(dismiss)
      
        host?.present(actionSheet, animated: true, completion: nil)
    }
}


