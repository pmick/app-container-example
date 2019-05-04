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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            guard let currentChild = self.children.first else { return }
            if self.userStore.currentUser != nil {
                self.cycle(from: currentChild, to: KittyFeedViewController())
            } else {
                self.cycle(from: currentChild, to: LoginViewController())
            }
        }
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
    
    private func add(initialChild viewController: UIViewController) {
        addChild(viewController)
        viewController.view.frame = self.view.bounds
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
}
