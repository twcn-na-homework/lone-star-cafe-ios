import UIKit
import SwiftUI

class ReceiptModule {
    static func entry(items: [MenuListViewModel.MenuItem]) -> UIViewController {
        let viewModel = ReceiptViewModel(selectedItems: items)
        let router = ReceiptRouter()
        return UIHostingController(rootView: ReceiptView(viewModel: viewModel))
    }
}
