//
//  ProgramDetailDataContainer.swift
//  MastersPortal
//
//  Created by HASAN CAN on 7/6/21.
//

import Foundation

struct ProgramDetailDataContainer {
    var universityName: String
    var programName: String

    var deadline: String?
    var language: String?
    var tution: String?
    var duration: String?

    var cityName: String
    var countryName: String

    init(program: Program, university: University, city: City) {
        universityName = university.name
        programName = program.name

        deadline = program.deadline
        language = program.language
        tution = "\(program.tutionAmount) \(program.tutionCurrency)"
        duration = program.duration

        cityName = city.name
        countryName = city.country
    }

    init(
        universityName: String,
        programName: String,
        deadline: String,
        language: String,
        duration: String,
        cityName: String,
        countryName: String,
        tutionAmount: Int,
        tutionCurrency: String) {
        self.universityName = universityName
        self.programName = programName

        self.deadline = deadline
        self.language = language
        tution = "\(tutionAmount) \(tutionCurrency)"
        self.duration = duration

        self.cityName = cityName
        self.countryName = countryName
    }
}
