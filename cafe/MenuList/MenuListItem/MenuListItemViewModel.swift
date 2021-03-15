
class MenuListItemViewModel {
    
    private(set) var menu: MenuListViewModel.MenuItem?
    
    var isChecked: Bool = false
    
    var title: String {
        menu?.description ?? "-"
    }
    
    var price: String {
        guard let m = menu else { return "NA"}
        return "$ \(Double(m.price) / 100.0)"
    }
    
    init(model: MenuListViewModel.MenuItem) {
        menu = model
    }
}

extension MenuListItemViewModel: ViewModel {}
