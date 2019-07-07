import UIKit

final class FlowContainerViewController: UIViewController {
    let userStore = UserStore()
    
    init(initialChildViewController: UIViewController) {
        super.init(nibName: nil, bundle: nil)

        add(initialChild: initialChildViewController)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func cycle(from oldViewController: UIViewController, to newViewController: UIViewController) {
        oldViewController.willMove(toParent: nil)
        addChild(newViewController)

        newViewController.view.alpha = 0

        transition(from: oldViewController, to: newViewController, duration: 0.2, options: [], animations: {
            newViewController.view.alpha = 1
        }) { (finished) in
            oldViewController.removeFromParent()
            newViewController.didMove(toParent: self)
        }
    }
    
    func cycle(to newViewController: UIViewController) {
        guard let oldViewController = children.first else {
            assertionFailure("Failed to get first child view controller.")
            return
        }
        cycle(from: oldViewController, to: newViewController)
    }
    
    private func add(initialChild viewController: UIViewController) {
        addChild(viewController)
        viewController.view.frame = self.view.bounds
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
}
