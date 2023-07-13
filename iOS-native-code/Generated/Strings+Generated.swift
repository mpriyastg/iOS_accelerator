// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  public enum HomeView {
    /// Api Integration
    public static let apiView = L10n.tr("Localizable", "HomeView.ApiView", fallback: "Api Integration")
    /// Camera/Gallery
    public static let cameraGallery = L10n.tr("Localizable", "HomeView.Camera/Gallery", fallback: "Camera/Gallery")
    /// Google Map
    public static let googleMap = L10n.tr("Localizable", "HomeView.GoogleMap", fallback: "Google Map")
    /// Loader
    public static let loader = L10n.tr("Localizable", "HomeView.Loader", fallback: "Loader")
    /// MapView
    public static let mapView = L10n.tr("Localizable", "HomeView.MapView", fallback: "MapView")
    /// Menu
    public static let menu = L10n.tr("Localizable", "HomeView.Menu", fallback: "Menu")
    /// ModifierView
    public static let modifierView = L10n.tr("Localizable", "HomeView.ModifierView", fallback: "ModifierView")
    /// Network Check
    public static let networkCheck = L10n.tr("Localizable", "HomeView.NetworkCheck", fallback: "Network Check")
    /// Popups
    public static let popups = L10n.tr("Localizable", "HomeView.Popups", fallback: "Popups")
    /// Share
    public static let share = L10n.tr("Localizable", "HomeView.Share", fallback: "Share")
    /// SwiftGen Json
    public static let swiftGenJson = L10n.tr("Localizable", "HomeView.SwiftGenJson", fallback: "SwiftGen Json")
    /// TabView
    public static let tabView = L10n.tr("Localizable", "HomeView.TabView", fallback: "TabView")
    /// UI Widgets
    public static let uiWidgets = L10n.tr("Localizable", "HomeView.UIWidgets", fallback: "UI Widgets")
    /// WebView
    public static let webView = L10n.tr("Localizable", "HomeView.WebView", fallback: "WebView")
  }
  public enum Slider {
    /// Slider
    public static let name = L10n.tr("Localizable", "Slider.name", fallback: "Slider")
  }
  public enum TabView {
    /// Localizable.strings
    ///   iOS-native-code
    /// 
    ///   Created by Mohanapriya on 04/07/23.
    public static let chat = L10n.tr("Localizable", "TabView.Chat", fallback: "Chat")
    /// Profile
    public static let profile = L10n.tr("Localizable", "TabView.Profile", fallback: "Profile")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
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
