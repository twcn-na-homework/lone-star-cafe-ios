import SwiftUI

struct Price {
    let subtotal: Float
    let discount: Float
    let tax: Float
    let total: Float
}

protocol ReceiptViewModelInput {
    func calcPrices() -> Price
}

protocol ReceiptViewModelOutput {

}

final class ReceiptViewModel {
    let items: [MenuListViewModel.MenuItem]

    init(selectedItems: [MenuListViewModel.MenuItem]) {
        items = selectedItems
    }
}

extension ReceiptViewModel: ReceiptViewModelInput {
    func calcPrices() -> Price {
        // TODO:
        return Price(subtotal: 0, discount: 0, tax: 0, total: 0)
    }
}

extension ReceiptViewModel: ViewModel {}
