//
//  FindMyMasters
//
//  Created by Hasan Can Aslan on 02.01.2021.
//

import UIKit

/// Firebase Auth supported identity providers and other methods of authentication
enum AuthProvider: String {
  case google = "google.com"
  case apple = "apple.com"
  case twitter = "twitter.com"
  case microsoft = "microsoft.com"
  case facebook = "facebook.com"
  case emailPassword = "password"

  /// More intuitively named getter for `rawValue`.
  var id: String { rawValue }

  /// The UI friendly name of the `AuthProvider`. Used for display.
  var name: String {
    switch self {
    case .google:
      return "Google"
    case .apple:
      return "Apple"
    case .twitter:
      return "Twitter"
    case .microsoft:
      return "Microsoft"
    case .facebook:
      return "Facebook"
    case .emailPassword:
      return "Email & Password Login"
    }
  }

  /// Failable initializer to create an `AuthProvider` from it's corresponding `name` value.
  /// - Parameter rawValue: String value representing `AuthProvider`'s name or type.
  init?(rawValue: String) {
    switch rawValue {
    case "Google":
      self = .google
    case "Apple":
      self = .apple
    case "Twitter":
      self = .twitter
    case "Microsoft":
      self = .microsoft
    case "Facebook":
      self = .facebook
    case "Email & Password Login":
      self = .emailPassword
    default: return nil
    }
  }
}

// MARK: DataSourceProvidable

extension AuthProvider: DataSourceProvidable {
  private static var providers: [AuthProvider] {
    [.google, .apple, .twitter, .microsoft, .facebook]
  }

  static var providerSection: Section {
    let providers = self.providers.map { Item(title: $0.name) }
    let header = "Identity Providers"
    let footer = "Choose a login flow from one of the identity providers above."
    return Section(headerDescription: header, footerDescription: footer, items: providers)
  }

  static var emailPasswordSection: Section {
    let image = UIImage(named: "firebaseIcon")
    let item = Item(title: emailPassword.name, hasNestedContent: true, image: image)
    let footer = "A example login flow with password authentication."
    return Section(footerDescription: footer, items: [item])
  }

  static var sections: [Section] {
    [providerSection, emailPasswordSection]
  }

  static var authLinkSections: [Section] {
    let allItems = AuthProvider.sections.flatMap { $0.items }
    let header = "Manage linking between providers"
    let footer =
      "Select an unchecked row to link the currently signed in user to that auth provider. To unlink the user from a linked provider, select its corresponding row marked with a checkmark."
    return [Section(headerDescription: header, footerDescription: footer, items: allItems)]
  }

  var sections: [Section] { AuthProvider.sections }
}
