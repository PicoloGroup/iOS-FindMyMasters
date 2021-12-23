//
//  CountryItemViewModel.swift
//  FindMyMasters
//
//  Created by Hasan Can Aslan on 25.11.2021.
//

import UIKit

class CountryItemViewModel: NSObject {
    var title: String
    var icon: UIImage

    init(title: String, icon: UIImage) {
        self.title = title
        self.icon = icon
    }
}
