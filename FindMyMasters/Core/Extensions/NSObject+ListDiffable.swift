//
//  NSObject+ListDiffable.swift
//  FindMyMasters
//
//  Created by Hasan Can Aslan on 20.12.2021.
//


import Foundation
import IGListKit

// MARK: - ListDiffable

extension NSObject: ListDiffable {
    public func diffIdentifier() -> NSObjectProtocol {
        self
    }

    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        isEqual(object)
    }
}
