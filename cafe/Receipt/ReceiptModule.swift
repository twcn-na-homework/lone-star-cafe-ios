import UIKit

class ReceiptModule {
    static func entry () -> UIViewController {
        let viewModel = ReceiptViewModel()
        let vc = ReceiptViewController()
        let router = ReceiptRouter()

        vc.configure(with: viewModel, router: router)
        router.host = vc
        return vc
    }
}
