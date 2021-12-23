//
//  Student.swift
//  FindMyMasters
//
//  Created by Hasan Can Aslan on 24.12.2021.
//

import Foundation

import IGListKit

class Student: Codable {
    init(id: Int, email: String, firstName: Double, lastName: Double, image: Double, birthDate: Double, userId: Int) {
        self.id = id
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.image = image
        self.birthDate = birthDate
        self.userId = userId
    }

    var id: Int
    var email: String
    var firstName: Double
    var lastName: Double
    var image: Double
    var birthDate: Double
    var userId: Int

    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case email
        case firstName = "firstname"
        case lastName = "lastname"
        case image
        case birthDate
        case userId
    }
}

extension Student: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? Student else { return false }
        return id == object.id
    }
}
