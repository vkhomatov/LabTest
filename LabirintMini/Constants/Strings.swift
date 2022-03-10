// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  /// 156 pickup points
  public static let _156PickupPoints = L10n.tr("Localizable", "156 pickup points")
  /// App settings
  public static let appSettings = L10n.tr("Localizable", "App settings")
  /// Basket
  public static let basket = L10n.tr("Localizable", "Basket")
  /// By logging in or registering, I agree with terms and conditions
  public static let byLoggingInOrRegisteringIAgreeWithTermsAndConditions = L10n.tr("Localizable", "By logging in or registering, I agree with terms and conditions")
  /// Catalog
  public static let catalog = L10n.tr("Localizable", "Catalog")
  /// Delivery
  public static let delivery = L10n.tr("Localizable", "Delivery")
  /// Labirint
  public static let labirint = L10n.tr("Localizable", "Labirint")
  /// Login
  public static let login = L10n.tr("Localizable", "Login")
  /// Logout
  public static let logout = L10n.tr("Localizable", "Logout")
  /// My coupons
  public static let myCoupons = L10n.tr("Localizable", "My coupons")
  /// My lab
  public static let myLab = L10n.tr("Localizable", "My lab")
  /// My orders
  public static let myOrders = L10n.tr("Localizable", "My orders")
  /// My reviews
  public static let myReviews = L10n.tr("Localizable", "My reviews")
  /// My subscriptions
  public static let mySubscriptions = L10n.tr("Localizable", "My subscriptions")
  /// Profile settings
  public static let profileSettings = L10n.tr("Localizable", "Profile settings")
  /// Promo
  public static let promo = L10n.tr("Localizable", "Promo")
  /// Purchased goods
  public static let purchasedGoods = L10n.tr("Localizable", "Purchased goods")
  /// Saving goods
  public static let savingGoods = L10n.tr("Localizable", "Saving goods")
  /// Sign in to get all the features of the profile
  public static let signInToGetAllTheFeaturesOfTheProfile = L10n.tr("Localizable", "Sign in to get all the features of the profile")
  /// Store Information
  public static let storeInformation = L10n.tr("Localizable", "Store Information")
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
