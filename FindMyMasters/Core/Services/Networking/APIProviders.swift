//
//  APIProviders.swift
//  FindMyMasters
//
//  Created by Hasan Can Aslan on 9.12.2021.
//

import Foundation
import Moya

enum Constant {
    static let token = "eyeAm.AJsoN.weBTOKen"
}

class APIProviders {
    static let shared = APIProviders()
    var authProvider: MoyaProvider<AuthAPI>
    var findAPIProvider: MoyaProvider<FindAPI>
    var authPlugin: AccessTokenPlugin

    init(authProvider: MoyaProvider<AuthAPI>, findAPIProvider: MoyaProvider<FindAPI>) {
        authPlugin = AccessTokenPlugin { _ in Constant.token }
        self.authProvider = authProvider
        self.findAPIProvider = findAPIProvider
    }

    init() {
        authProvider = MoyaProvider<AuthAPI>(plugins: [NetworkLoggerPlugin(configuration: .init(formatter: .init(responseData: JSONResponseDataFormatter),
                                                                                                logOptions: .verbose))])
        let authPlugin = AccessTokenPlugin { _ in Constant.token }
        self.authPlugin = authPlugin
        findAPIProvider = MoyaProvider<FindAPI>(plugins: [NetworkLoggerPlugin(configuration: .init(formatter: .init(responseData: JSONResponseDataFormatter),
                                                                                                   logOptions: .verbose)), authPlugin])
    }
}
