
class MenuListItemViewModel {
    
    private(set) var menu: MenuListViewModel.MenuItem?
    
    var isChecked: Bool = false
    
    var title: String {
        return menu?.description ?? "-"
    }
    
    var price: String {
        guard let m = menu else { return "NA"}
        return "$ \(m.price)"
    }
    
    init(model: MenuListViewModel.MenuItem) {
        menu = model
    }
}

extension MenuListItemViewModel: ViewModel {}
