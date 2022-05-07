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
        //getAndSaveToken()
        return true
    }

}

// MARK: - Token

extension AppDelegate {
    
//    func getAndSaveToken(update: Bool = true) {
//        if let savedToken = try? KeyChainService().readToken(), !update {
//            debugPrint("Saved token from KeyChain = \(savedToken)")
//        } else {
//            UserService().getToken(with: ParametersService().makeParams(add: ["token" : ""]))
//                .onCompleted { data in
//                    if let token = data.token {
//                        guard let _ = try? KeyChainService().updateToken(token: token) else {
//                            try? KeyChainService().saveToken(token: token)
//                            return
//                        }
//                    }
//                }.onError { error in
//                    debugPrint(error.localizedDescription)
//                }
//        }
//    }

}

