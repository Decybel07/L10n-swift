//
//  Int+Localizable.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 08.05.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

extension Int: Localizable {

    /**
     Returns a localized `self` description.

     - parameter instance: The instance of `L10n` used for localization.
     */
    public func l10n(_ instance: L10n) -> String {
        return (self as NSNumber).l10n(instance)
    }

    /**
     Returns a localized `self` description.

     - parameter instance: The instance of `L10n` used for localization.
     - parameter closure: A closure used to configure the `NumberFormatter`.

     - returns: A localized `self` description.
     */
    public func l10n(_ instance: L10n = .shared, closure: (NumberFormatter) -> Void) -> String {
        return (self as NSNumber).l10n(instance, closure: closure)
    }

    /**
     Returns a localized `self` description with leading zeros.

     - parameter instance: The instance of L10n used for localization.
     - parameter minIntegerDigits: The minimal number of integer digits.

     - returns: A localized `self` description with leading zeros.
     */
    public func l10n(_ instance: L10n = .shared, minIntegerDigits: Int) -> String {
        return self.l10n(instance) { formatter in
            formatter.minimumIntegerDigits = minIntegerDigits
        }
    }
}
