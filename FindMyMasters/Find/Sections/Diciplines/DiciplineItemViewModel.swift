//
//  DiciplineItemViewModel.swift
//  FindMyMasters
//
//  Created by Hasan Can Aslan on 25.11.2021.
//

import UIKit

class DiciplineItemViewModel: NSObject {
    var buttonTitle: String
    var title: String
    var subtitle: String
    var icon: UIImage

    init(title: String, subtitle: String, icon: UIImage, buttonTitle: String) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.buttonTitle = buttonTitle
    }
}
