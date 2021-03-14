import UIKit

protocol TransitionAnimator: UIViewControllerAnimatedTransitioning {}

protocol TransitionProtocol: class {
    var viewController: UIViewController? { get }
    var animator: TransitionAnimator? { get }

    func open(to: UIViewController)
    func close()
}