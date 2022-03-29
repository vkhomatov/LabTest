import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    var window: UIWindow?
    
    // MARK: - Private Properties

    private var userService: UserServiceProtocol
    private var parametersService: ParametersServiceProtocol
    private var keyChainService: KeyChainServiceProtocol
    private var tokenEntity: TokenEntity? {
        didSet {
            if let token = self.tokenEntity?.token {
                guard let _ = try? self.keyChainService.updateToken(token: token) else {
                    try? self.keyChainService.saveToken(token: token)
                    return
                }
                    
            }
        }
    }
    
    // MARK: - Initialization

    override init() {
        userService = UserService()
        parametersService = ParametersService()
        keyChainService = KeyChainService()
        super.init()
    }

    // MARK: - UIApplicationDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let mainTabBarScreen = MainTabBarConfigurator().configure()
        self.window?.rootViewController = mainTabBarScreen
        self.window?.makeKeyAndVisible()
        self.getToken()
        return true
    }

}

// MARK: - Token

extension AppDelegate {
    
    func getToken(update: Bool = true) {
        if let savedToken = try? keyChainService.readToken(), !update {
            debugPrint("Saved token from KeyChain = \(savedToken)")
        } else {
            userService.getToken(with: parametersService.makeParams(add: [:]))
                .onCompleted { [weak self] data in
                    self?.tokenEntity = data
                }.onError { error in
                    debugPrint(error.localizedDescription)
                }
        }
    }

}

