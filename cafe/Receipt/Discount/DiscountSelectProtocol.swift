import Foundation

enum DiscountType {
    case none
    case amount
    case percentage
}

struct Discount: Identifiable, Equatable {
    var id = UUID()
    var code: String
    var discountPct: Int? = nil
    var discountAmout: Int? = nil
    var applyOn: [ItemType]
}

protocol DiscountTypeSelectOutput: AnyObject {
    func onSelectChanged(discount: Discount?, type: DiscountType)
}
