//
//  API.swift
//  FindMyMasters
//
//  Created by Hasan Can Aslan on 23.11.2021.
//

import Foundation
import Moya

public enum AuthAPI {
    case signup(String, String)
    case login(String, String)
//    case forgotPassword
//    case changePassword
//    case resetPassword
//    case resendVerification
//    case changeEmail
}

extension AuthAPI: TargetType {
    public var baseURL: URL { URL(string: "\(Environment.findMyMastersAPIBaseURL)/auth/student")! }

    public var path: String {
        switch self {
        case .login:
            return "/login"
        case .signup:
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


