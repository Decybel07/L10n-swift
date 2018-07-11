//
//  NSNumber+Localizable.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 01.06.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

extension NSNumber: Localizable {

    /**
     Returns a localized `self` description.

     - parameter instance: The instance of `L10n` used for localization.
     */
    public func l10n(_ instance: L10n) -> String {
        return self.description(withLocale: instance.locale)
    }

    /**
     Returns a localized `self` description.

     - parameter instance: The instance of `L10n` used for localization.
     - parameter closure: A closure used to configure the `NumberFormatter`.

     - returns: A localized `self` description.
     */
    public func l10n(_ instance: L10n = .shared, closure: (_ formatter: NumberFormatter) -> Void) -> String {
        let formatter = NumberFormatter()
        formatter.locale = instance.locale
        formatter.numberStyle = .decimal
        closure(formatter)
        return formatter.string(from: self)!
    }
}
