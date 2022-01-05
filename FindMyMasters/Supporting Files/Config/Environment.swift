//
//  Environment.swift
//  FindMyMasters
//
//  Created by Hasan Can Aslan on 9.12.2021.
//

import Foundation

/// Use the Environment.plist file to provide variables dependent on build configuration.
/// An example would be the backend url, where for different build configurations you have different backend urls.

// MARK: - Environment variables

extension Environment {
    enum KeyName {
        static let findMyMastersAPIBaseURLKey: String = "API_BASE_URL"
    }
}

enum Environment {
    static var findMyMastersAPIBaseURL: URL {
        do {
            var baseURLString: String = try Environment.value(for: KeyName.findMyMastersAPIBaseURLKey)
            baseURLString = baseURLString.replacingOccurrences(of: "#()", with: "//")
            guard let baseURL = URL(string: baseURLString) else { throw Error.parsingError }
            return baseURL
        } catch {
            fatalError()
        }
    }
}

// MARK: - Errors

extension Environment {
    enum Error: Swift.Error {
        case missingKey
        case invalidEnvironmentPath
        case malformedDictionary
        case invalidValue
        case parsingError
    }
}

// MARK: - Fetching value

extension Environment {
//    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
//        guard let path = Bundle.main.path(forResource: "Environment", ofType: "plist") else {
//            throw Error.invalidEnvironmentPath
//        }
//
//        guard let dictionary = NSDictionary(contentsOfFile: path) else {
//            throw Error.malformedDictionary
//        }
//
//        guard let object = dictionary.object(forKey: key) else {
//            throw Error.missingKey
//        }
//
//        switch object {
//        case let value as T:
//            return value
//
//        case let string as String:
//            guard let value = T(string) else { throw Error.invalidValue }
//            return value
//
//        default:
//            throw Error.invalidValue
//        }
//    }

    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
            throw Error.missingKey
        }

        switch object {
        case let value as T:
            return value

        case let string as String:
            guard let value = T(string) else { throw Error.invalidValue }
            return value

        default:
            throw Error.invalidValue
        }
    }
}
