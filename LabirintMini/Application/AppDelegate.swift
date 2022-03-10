import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    var window: UIWindow?

    // MARK: - UIApplicationDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let mainTabBarScreen = MainTabBarConfigurator().configure()
        self.window?.rootViewController = mainTabBarScreen
        self.window?.makeKeyAndVisible()
        return true
    }

}
