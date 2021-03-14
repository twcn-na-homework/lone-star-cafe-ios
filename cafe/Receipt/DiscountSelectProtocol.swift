enum DiscountType {
    case none
    case amount
    case percentage
}

protocol DiscountTypeSelectOutput {
    func onSelectChanged(state: DiscountType)
}


