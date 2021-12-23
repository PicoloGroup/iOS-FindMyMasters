//
//  ExtraLargeAppCellData.swift
//  FindMyMasters
//
//  Created by Hasan Can Aslan on 25.11.2021.
//

import UIKit

class FeaturedItemViewModel: NSObject {
    var caption: String
    var title: String
    var subtitle: String
    var thumbnail: UIImage

    init(caption: String, title: String, subtitle: String, thumbnail: UIImage) {
        self.caption = caption
        self.title = title
        self.subtitle = subtitle
        self.thumbnail = thumbnail
    }
}
