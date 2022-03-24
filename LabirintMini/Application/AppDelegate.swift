import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    var window: UIWindow?
    
    // MARK: - Private Properties

    private var userService: UserServiceProtocol
    private var signatureService: SignatureServiceProtocol
    private var keyChainService: KeyChainServiceProtocol
    private var tokenEntity: TokenEntity? {
        didSet {
            if let token = self.tokenEntity?.token {
                try? self.keyChainService.saveToken(token: token)
            }
        }
    }
    
    // MARK: - Initialization

    override init() {
        userService = UserService()
        signatureService = SignatureService()
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
    
    func getToken() {
        if let savedToken = try? keyChainService.readToken() {
            debugPrint("Saved token from KeyChain = \(savedToken)")
        } else {
            let token = ""
            let imagesize = "2"
            let paramString = signatureService.getParamString(parameters: userService.buildParameters(add: [:], token: token, imagesize: imagesize))
            let sig = signatureService.getMD5Signature(strParameters: paramString)
        
            userService.getToken(with: userService.buildParameters(add: ["sig" : sig], token: token, imagesize: imagesize))
                .onCompleted { [weak self] data in
                    self?.tokenEntity = data
                }.onError { error in
                    debugPrint(error.localizedDescription)
                }
        }
    }

}

