import UIKit

class ReceiptViewController: UIViewController {
    var router: ReceiptRouter?
    var viewModel: ReceiptViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        title = "Receipt"
        view.backgroundColor = .init(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)

        let discount = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(discountBtnTapped))
        navigationItem.rightBarButtonItem = discount
    }
}

/// Mark: - Actions
extension ReceiptViewController {
    @objc func discountBtnTapped() {
        router?.showDiscountList()
    }
}

/// Mark: - ViewProtocol
extension ReceiptViewController: ConfigurableView {
    func configure(with vm: ViewModel, router: RouterProtocol?) {
        self.viewModel = vm as? ReceiptViewModel
        self.router = router as? ReceiptRouter
    }
}

/// Mark: - DiscountTypeSelectOutput
extension ReceiptViewController: DiscountTypeSelectOutput {
    func onSelectChanged(discount: Discount?, type: DiscountType) {
        // TODO: 
    }
}
