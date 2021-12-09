// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import AnimatedTabBar
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length implicit_return

// MARK: - Storyboard Scenes

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
internal enum StoryboardScene {
  internal enum City: StoryboardType {
    internal static let storyboardName = "City"

    internal static let initialScene = InitialSceneType<UIKit.UINavigationController>(storyboard: City.self)

    internal static let cityListViewController = SceneType<CityListViewController>(storyboard: City.self, identifier: "CityListViewController")
  }
  internal enum CityDetail: StoryboardType {
    internal static let storyboardName = "CityDetail"

    internal static let cityDetailViewController = SceneType<CityDetailViewController>(storyboard: CityDetail.self, identifier: "CityDetailViewController")
  }
  internal enum Find: StoryboardType {
    internal static let storyboardName = "Find"

    internal static let initialScene = InitialSceneType<UIKit.UINavigationController>(storyboard: Find.self)

    internal static let exploreViewController = SceneType<ExploreViewController>(storyboard: Find.self, identifier: "ExploreViewController")
  }
  internal enum LaunchScreen: StoryboardType {
    internal static let storyboardName = "LaunchScreen"

    internal static let initialScene = InitialSceneType<UIKit.UIViewController>(storyboard: LaunchScreen.self)
  }
  internal enum Main: StoryboardType {
    internal static let storyboardName = "Main"

    internal static let initialScene = InitialSceneType<AnimatedTabBar.AnimatedTabBarController>(storyboard: Main.self)
  }
  internal enum ProgramDetail: StoryboardType {
    internal static let storyboardName = "ProgramDetail"

    internal static let initialScene = InitialSceneType<ProgramDetailViewController>(storyboard: ProgramDetail.self)

    internal static let programDetailViewController = SceneType<ProgramDetailViewController>(storyboard: ProgramDetail.self, identifier: "ProgramDetailViewController")
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

// MARK: - Implementation Details

internal protocol StoryboardType {
  static var storyboardName: String { get }
}

internal extension StoryboardType {
  static var storyboard: UIStoryboard {
    let name = self.storyboardName
    return UIStoryboard(name: name, bundle: BundleToken.bundle)
  }
}

internal struct SceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type
  internal let identifier: String

  internal func instantiate() -> T {
    let identifier = self.identifier
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }

  @available(iOS 13.0, tvOS 13.0, *)
  internal func instantiate(creator block: @escaping (NSCoder) -> T?) -> T {
    return storyboard.storyboard.instantiateViewController(identifier: identifier, creator: block)
  }
}

internal struct InitialSceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type

  internal func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }

  @available(iOS 13.0, tvOS 13.0, *)
  internal func instantiate(creator block: @escaping (NSCoder) -> T?) -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController(creator: block) else {
      fatalError("Storyboard \(storyboard.storyboardName) does not have an initial scene.")
    }
    return controller
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
