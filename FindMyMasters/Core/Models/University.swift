//
//  University.swift
//  FindMyMasters
//
//  Created by Hasan Can Aslan on 20.12.2021.
//

import IGListKit

class University: Codable {
    var id: String
    var name: String
    var image: String?
    var rank: String?
    var cityId: String?

    init(
        id: String,
        name: String,
        image: String?,
        rank: String?,
        cityId: String?,
    ) {
        self.id = id
        self.name = name
        self.image = image
        self.rank = rank
        self.cityId = cityId
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case image
        case rank
        case cityId
    }
}

extension University: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? University else { return false }
        return id == object.id
    }
}
