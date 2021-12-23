//
//  Moya+Extensions.swift
//  FindMyMasters
//
//  Created by Hasan Can Aslan on 25.11.2021.
//

import Foundation
import Moya

// MARK: - Provider support
private extension String {
    var urlEscaped: String {
        self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

// MARK: - Response Handlers
extension Moya.Response {
    func mapNSArray() throws -> NSArray {
        let any = try self.mapJSON()
        guard let array = any as? NSArray else {
            throw MoyaError.jsonMapping(self)
        }
        return array
    }
}

func JSONResponseDataFormatter(_ data: Data) -> String {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
    } catch {
        return String(data: data, encoding: .utf8) ?? ""
    }
}

public func url(_ route: TargetType) -> String {
    route.baseURL.appendingPathComponent(route.path).absoluteString
}
