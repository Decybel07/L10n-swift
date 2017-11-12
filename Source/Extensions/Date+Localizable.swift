//
//  Date+Localizable.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 29.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

extension Date: Localizable {

    /**
     Returns a localized `self` description.

     - parameter instance: The instance of `L10n` used for localization.
     */
    public func l10n(_ instance: L10n) -> String {
        return self.l10n(instance) { formatter in
            formatter.dateStyle = .medium
            formatter.timeStyle = .medium
        }
    }

    /**
     Returns a localized `self` description.

     - parameter instance: The instance of `L10n` used for localization.
     - parameter closure: A closure used to configure the `DateFormatter`.

     - returns: A localized `self` description.
     */
    public func l10n(_ instance: L10n = .shared, closure: (DateFormatter) -> Void) -> String {
        let formatter = DateFormatter()
        formatter.locale = instance.locale
        closure(formatter)
        return formatter.string(from: self)
    }
}
