import SwiftUI
import Combine

class ReceiptItemViewModel: ObservableObject {
    let item: MenuListViewModel.MenuItem

    init(item: MenuListViewModel.MenuItem) {
        self.item = item
    }
}

extension ReceiptItemViewModel {
    var title: String {
        item.description
    }

    var price: String {
        "\(Double(item.price) / 100.0)"
    }
}