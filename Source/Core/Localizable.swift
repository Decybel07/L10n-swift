//
//  Localizable.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 03.06.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

/// Protocol Localizable.
public protocol Localizable {

    /**
     Returns a localized `self` description.
     */
    func l10n() -> String

    /**
     Returns a localized `self` description.

     - parameter instance: The instance of `L10n` used for localization.
     */
    func l10n(_ instance: L10n) -> String
}

public extension Localizable {

    func l10n() -> String {
        return self.l10n(.shared)
    }
}
