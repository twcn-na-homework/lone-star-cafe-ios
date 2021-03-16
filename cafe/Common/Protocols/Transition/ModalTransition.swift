import UIKit

class ModalTransition {
    weak var viewController: UIViewController?
    var animator: TransitionAnimator?

    init(viewController: UIViewController, animator: TransitionAnimator? = nil) {
        self.viewController = viewController
        self.animator = animator
    }
}

extension ModalTransition: TransitionProtocol {
    func open(to: UIViewController) {
        viewController?.present(to, animated: true)
    }

    func close() {
        viewController?.dismiss(animated: true)
    }
}