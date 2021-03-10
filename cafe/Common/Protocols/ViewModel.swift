import UIKit

protocol ViewModel: class {
    var output: ViewModelOutput? { get set }
}

extension ViewModel {
    var output: ViewModelOutput? {
        set {}
        get { return nil }
    }
}

protocol ViewModelOutput {
    func viewModelChanged(_ vm: ViewModel)
}

