//
//  Int+l10n.swift
//  L10n
//
//  Created by Adrian Bobrowski on 08.05.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

extension Int: Localizable {

    /**
     Returns a localized **self** description value.

     - returns: A localized **self** description value.
     */
    public func l10n() -> String {
        return (self as NSNumber).l10n()
    }

    /**
     Returns a localized **self** description value with leading zeros.

     - returns: A localized **self** description value with leading zeros.
     */
    public func l10n(minIntegerDigits: Int) -> String {
        let formatter = NumberFormatter()
        formatter.locale = L10n.shared.locale
        formatter.minimumIntegerDigits = minIntegerDigits
        return formatter.string(from: self as NSNumber)!
    }
}
