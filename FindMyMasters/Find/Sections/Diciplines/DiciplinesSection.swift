//
//  DiciplinesSection.swift
//  FindMyMasters
//
//  Created by Hasan Can Aslan on 25.11.2021.
//

import IGListKit

typealias DiciplinesSectionViewModel = SectionViewModel<DiciplineItemViewModel>

struct DiciplinesSection: CollectionSection {
    var layoutSection: NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.92), heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 3)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered

        return section
    }

    var sectionController: ListSectionController
    var viewModel: ListDiffable

    init(_ viewModel: DiciplinesSectionViewModel) {
        self.viewModel = viewModel
        sectionController = DiciplinesSectionController()
    }
}
