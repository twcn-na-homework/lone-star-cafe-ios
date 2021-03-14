import UIKit

class PushTransition: NSObject {
    weak var viewController: UIViewController?
    var animator: TransitionAnimator?

    init(viewController: UIViewController, animator: TransitionAnimator? = nil) {
        self.viewController = viewController
        self.animator = animator
    }
}

extension PushTransition: TransitionProtocol {
    func open(to toVC: UIViewController) {
        viewController?.navigationController?.delegate = self
        viewController?.navigationController?.pushViewController(toVC, animated: true)
    }

    func close() {
       viewController?.navigationController?.popViewController(animated: true)
    }
}

extension PushTransition: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator
    }
}