
class MenuListItemViewModel {
    
    private(set) var menu: MenuModel?
    
    var isChecked: Bool = false
    
    var title: String {
        return menu?.description ?? "-"
    }
    
    var price: String {
        guard let m = menu else { return "NA"}
        return "$ \(m.price)"
    }
    
    init(model: MenuModel) {
        menu = model
    }
}

extension MenuListItemViewModel: ViewModel {}
