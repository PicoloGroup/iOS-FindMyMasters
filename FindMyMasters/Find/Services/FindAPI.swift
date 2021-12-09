//
//  FindAPI.swift
//  FindMyMasters
//
//  Created by Hasan Can Aslan on 25.11.2021.
//

import Foundation
import Moya

// MARK: - Provider setup

public enum FindAPI {
    case signup(String, String)
    case login(String, String)
//    case forgotPassword
//    case changePassword
//    case resetPassword
//    case resendVerification
//    case changeEmail
}

extension FindAPI: TargetType, AccessTokenAuthorizable {
    public var authorizationType: AuthorizationType? {
        return .bearer
    }

    public var baseURL: URL { URL(string: "\(Environment.findMyMastersAPIBaseURL)/auth/student")! }

    public var path: String {
        switch self {
        case let .login(email, password):
            return "/login"
        case let .signup(email, password):
            return "/signup"
        }
    }

    public var method: Moya.Method { .post }

    public var task: Task {
        switch self {
        case let .login(email, password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: URLEncoding.default)
        case let .signup(email, password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: URLEncoding.default)
        }
    }

    public var validationType: ValidationType {
        return .successCodes
    }

    public var headers: [String: String]? { nil }
}
