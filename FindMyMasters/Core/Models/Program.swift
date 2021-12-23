//
//  Program.swift
//  FindMyMasters
//
//  Created by Hasan Can Aslan on 20.12.2021.
//

import IGListKit

class Program: Codable {
    var id: Int
    var universityId: String
    var name: String
    var duration: String?
    var language: String?
    var deadline: String?
    var mode: String?
    var schedule: String?
    var field: String?
    var url: String?
    var tuitionAmount: Float?
    var tuitionCurrency: String?

    init(id: Int, universityId: String, name: String, duration: String? = nil, language: String? = nil, deadline: String? = nil, mode: String? = nil, schedule: String? = nil, field: String? = nil, url: String? = nil, tuitionAmount: Float? = nil, tuitionCurrency: String? = nil) {
        self.id = id
        self.universityId = universityId
        self.name = name
        self.duration = duration
        self.language = language
        self.deadline = deadline
        self.mode = mode
        self.schedule = schedule
        self.field = field
        self.url = url
        self.tuitionAmount = tuitionAmount
        self.tuitionCurrency = tuitionCurrency
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case universityId
        case name
        case duration
        case language
        case deadline
        case mode
        case schedule
        case field
        case url
        case tuitionAmount
        case tuitionCurrency
    }
}

extension Program: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? Program else { return false }
        return id == object.id
    }
}
