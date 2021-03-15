protocol ReceiptViewModelInput {
    func fetchDiscounts()
    func calcPrices() -> ReceiptViewModel.Price
}

protocol ReceiptViewModelOutput {

}

class ReceiptViewModel {
    typealias Discount = FetchDiscountsQuery.Data.Discount

    struct Price {
        let subtotal: Float
        let discount: Float
        let tax: Float
        let total: Float
    }

    var discountType: DiscountType = .none

    let items: [MenuListViewModel.MenuItem]

    init(selectedItems: [MenuListViewModel.MenuItem]) {
        items = selectedItems
    }

    private(set) lazy var discount: Discount = {
        return Discount.init(code: "Food", discountPct: 10, discountAmount: 5, applyOn: [.fruits, .snacks, .dishes])
    }()

    var discountDesc: String {
        let amount = Double(discount.discountAmount ?? 0) / 100.0
        let applyOn = discount.applyOn.map {
            "\($0.rawValue)"
        }.joined(separator: ",").lowercased()

        return """
               ============Discount info============
               percentage: \(discount.discountAmount ?? 100)%
               amount: \(amount)
               apply on: \(applyOn)
               ==================================
               """
    }
}

extension ReceiptViewModel: ReceiptViewModelInput {
    func fetchDiscounts() {

    }

    func calcPrices() -> ReceiptViewModel.Price {
        // TODO: Implement the calc logic here

        return Price(subtotal: 0, discount: 0, tax: 0, total: 0)
    }
}

extension ReceiptViewModel: ViewModel {

}
