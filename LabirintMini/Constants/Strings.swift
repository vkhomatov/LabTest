// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {

  public enum MyLab {
    /// App settings
    public static let appSettings = L10n.tr("Localizable", "MyLab.appSettings")
    /// Balance
    public static let balance = L10n.tr("Localizable", "MyLab.balance")
    /// %@ ₽
    public static func balanceSing(_ p1: Any) -> String {
      return L10n.tr("Localizable", "MyLab.balanceSing", String(describing: p1))
    }
    /// Delivery
    public static let delivery = L10n.tr("Localizable", "MyLab.delivery")
    /// Discount
    public static let discount = L10n.tr("Localizable", "MyLab.discount")
    /// %@ ₽ for discount increase for  %@ %%
    public static func discountIncrease(_ p1: Any, _ p2: Any) -> String {
      return L10n.tr("Localizable", "MyLab.discountIncrease", String(describing: p1), String(describing: p2))
    }
    /// %@ %%
    public static func discountSing(_ p1: Any) -> String {
      return L10n.tr("Localizable", "MyLab.discountSing", String(describing: p1))
    }
    /// %@ in fire
    public static func inFire(_ p1: Any) -> String {
      return L10n.tr("Localizable", "MyLab.inFire", String(describing: p1))
    }
    /// %@ in processing
    public static func inProcessing(_ p1: Any) -> String {
      return L10n.tr("Localizable", "MyLab.inProcessing", String(describing: p1))
    }
    /// Login
    public static let login = L10n.tr("Localizable", "MyLab.login")
    /// Logout
    public static let logout = L10n.tr("Localizable", "MyLab.logout")
    /// My coupons
    public static let myCoupons = L10n.tr("Localizable", "MyLab.myCoupons")
    /// My orders
    public static let myOrders = L10n.tr("Localizable", "MyLab.myOrders")
    /// My reviews
    public static let myReviews = L10n.tr("Localizable", "MyLab.myReviews")
    /// My subscriptions
    public static let mySubscriptions = L10n.tr("Localizable", "MyLab.mySubscriptions")
    /// %@ pickup points
    public static func pickupPoints(_ p1: Any) -> String {
      return L10n.tr("Localizable", "MyLab.pickupPoints", String(describing: p1))
    }
    /// Profile settings
    public static let profileSettings = L10n.tr("Localizable", "MyLab.profileSettings")
    /// Purchased goods
    public static let purchasedGoods = L10n.tr("Localizable", "MyLab.purchasedGoods")
    /// Saving goods
    public static let savingGoods = L10n.tr("Localizable", "MyLab.savingGoods")
    /// By logging in or registering, I agree with terms and conditions
    public static let signInAgree = L10n.tr("Localizable", "MyLab.signInAgree")
    /// Sign in to get all the features of the profile
    public static let signInInfo = L10n.tr("Localizable", "MyLab.signInInfo")
    /// Store Information
    public static let storeInformation = L10n.tr("Localizable", "MyLab.storeInformation")
    /// %@ updates
    public static func updates(_ p1: Any) -> String {
      return L10n.tr("Localizable", "MyLab.updates", String(describing: p1))
    }
  }

  public enum TabBar {
    /// Basket
    public static let basket = L10n.tr("Localizable", "TabBar.basket")
    /// Catalog
    public static let catalog = L10n.tr("Localizable", "TabBar.catalog")
    /// Labirint
    public static let labirint = L10n.tr("Localizable", "TabBar.labirint")
    /// My lab
    public static let mylab = L10n.tr("Localizable", "TabBar.mylab")
    /// Promo
    public static let promo = L10n.tr("Localizable", "TabBar.promo")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
