import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private let flowCoordinator = AppFlowCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let appWindow = UIWindow()
        window = appWindow
        appWindow.makeKeyAndVisible()
        flowCoordinator.start(with: appWindow)
        
        return true
    }
}
