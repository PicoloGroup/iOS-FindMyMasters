//
//  FindMyMasters
//
//  Created by Hasan Can Aslan on 02.01.2021.
//

/// Namespace for peformable actions on a Firebase User instance
enum UserAction: String {
  case signOut = "Sign Out"
  case link = "Link/Unlink Auth Providers"
  case requestVerifyEmail = "Request Verify Email"
  case tokenRefresh = "Token Refresh"
  case delete = "Delete"
  case updateEmail = "Email"
  case updatePhotoURL = "Photo URL"
  case updateDisplayName = "Display Name"
  case refreshUserInfo = "Refresh User Info"
}
