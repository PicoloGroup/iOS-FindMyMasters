//
//  SectionTitleViewModel.swift
//  FindMyMasters
//
//  Created by Hasan Can Aslan on 25.11.2021.
//

import Foundation

class SectionTitleViewModel: NSObject {
    var title: String
    var navigationTitle: String?

    init(title: String, navigationTitle: String? = nil) {
        self.title = title
        self.navigationTitle = navigationTitle
    }
}
