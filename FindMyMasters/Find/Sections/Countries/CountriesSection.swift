//
//  CountriesSection.swift
//  FindMyMasters
//
//  Created by Hasan Can Aslan on 25.11.2021.
//

import IGListKit

typealias CountriesSectionViewModel = SectionViewModel<CountryItemViewModel>

struct CountriesSection: CollectionSection {
    var layoutSection: NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        return section
    }

    var sectionController: ListSectionController
    var viewModel: ListDiffable

    init(_ viewModel: CountriesSectionViewModel) {
        self.viewModel = viewModel
        sectionController = CountriesSectionController()
    }
}
