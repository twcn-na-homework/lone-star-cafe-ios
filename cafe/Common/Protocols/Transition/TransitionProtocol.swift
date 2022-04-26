import UIKit

protocol TransitionAnimator: UIViewControllerAnimatedTransitioning {}

protocol TransitionProtocol: AnyObject {
    var viewController: UIViewController? { get }
    var animator: TransitionAnimator? { get }

    func open(to: UIViewController)
    func close()
}
