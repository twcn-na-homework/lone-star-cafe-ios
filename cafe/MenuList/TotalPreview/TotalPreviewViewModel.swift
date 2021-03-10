import UIKit

class TotalPreviewViewModal: ViewModel {
    weak var output: ViewModelOutput?
    var numberOfItem: Int = 0 {
        didSet {
            notify()
        }
    }
}

extension TotalPreviewViewModal {
    func notify() {
        self.output?.viewModelChanged(self)
    }
}
