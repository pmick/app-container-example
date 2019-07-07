import UIKit

final class AppFlowCoordinator {
    private var flowContainerViewController: FlowContainerViewController?
    
    func start(with window: UIWindow) {
        let splashViewController = UIStoryboard(name: "LaunchScreen", bundle: nil).instantiateInitialViewController()!
        flowContainerViewController = FlowContainerViewController(initialChildViewController: splashViewController)
        window.rootViewController = flowContainerViewController
        
        if UserStore().currentUser == nil {
            handleLogout()
        } else {
            handleLogin()
        }
    }
    
    private func makeAppRootViewController() -> UIViewController {
        let feedViewController = KittyFeedViewController()
        let profileViewController = ProfileViewController(logoutHandler: handleLogout)
        let tabBarViewController = UITabBarController()
        tabBarViewController.viewControllers = [feedViewController, profileViewController]
        return tabBarViewController
    }
    
    private func handleLogin() {
        self.flowContainerViewController?.cycle(to: makeAppRootViewController())
    }
    
    private func handleLogout() {
        self.flowContainerViewController?.cycle(to: LoginViewController(loginHandler: handleLogin))
    }
}
