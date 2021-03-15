protocol ReceiptViewModelInput {
    func fetchDiscounts()
}

protocol ReceiptViewModelOutput {

}

class ReceiptViewModel {
    typealias Discount = FetchDiscountsQuery.Data.Discount

    var discountType: DiscountType = .none

    let items: [MenuListViewModel.MenuItem]

    init(selectedItems: [MenuListViewModel.MenuItem]) {
        items = selectedItems
    }

    private(set) lazy var discount: Discount = {
        return Discount.init(code: "Food", discountPct: 10, discountAmount: 5, applyOn: [.fruits, .snacks, .dishes])
    }()

    var discountDesc: String {
        let per = Double(discount.discountPct ?? 0) / 100.0
        let applyOn = discount.applyOn.map {
            "\($0.rawValue)"
        }.joined(separator: ",").lowercased()

        return """
               ============Discount info============
               percentage: \(per)%
               amount: \(discount.discountAmount ?? 0)
               apply on: \(applyOn)
               ==================================
               """
    }
}

extension ReceiptViewModel: ReceiptViewModelInput {
    func fetchDiscounts() {

    }
}

extension ReceiptViewModel: ViewModel {

}
