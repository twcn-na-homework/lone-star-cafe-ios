import UIKit

protocol ViewModel {
//    var output: ViewModelOutput? { get set }
}

extension ViewModel {
//    var output: ViewModelOutput? {
//        set {}
//        get { return nil }
//    }
}

protocol ViewModelOutput: class {
    func viewModelChanged(_ vm: ViewModel)
}

