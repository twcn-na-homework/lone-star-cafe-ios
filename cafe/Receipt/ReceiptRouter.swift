import UIKit

protocol ReceiptRouterProtocol: RouterProtocol {
    func showDiscountOptions(title: String?)
    func showDiscountList()
}

final class ReceiptRouter: ReceiptRouterProtocol {
    weak var host: UIViewController?

    var output: DiscountTypeSelectOutput? {
        host as? ReceiptViewController
    }

    func showDiscountOptions(title: String?) {
//        guard let hostVC = host else {
//            return
//        }
//        let actionSheet = UIAlertController(title: "Select Discount Type", message: title, preferredStyle: .actionSheet)
//        let percentage = UIAlertAction(title: "Percentage", style: .default) { [weak self] _ in
//            self?.output?.onSelectChanged(state: .percentage)
//        }
//        let none = UIAlertAction(title: "No Discount", style: .default) { [weak self] _ in
//            self?.output?.onSelectChanged(state: .none)
//        }
//        let amount = UIAlertAction(title: "Amount", style: .default) { [weak self] _ in
//            self?.output?.onSelectChanged(state: .amount)
//        }
//        let dismiss = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
//
//        actionSheet.addAction(percentage)
//        actionSheet.addAction(amount)
//        actionSheet.addAction(none)
//        actionSheet.addAction(dismiss)
//
//        ModalTransition(viewController: hostVC).open(to: actionSheet)
    }
    
    func showDiscountList() {
        guard let hostVC = host as? ReceiptViewController else {
            return
        }
        
        let vm = DiscountCodeListViewModel(service: DiscountService())
        let vc = DiscountListController(viewModel: vm)
        vc.delegate = hostVC
        PushTransition(viewController: hostVC).open(to: vc)
    }
}


