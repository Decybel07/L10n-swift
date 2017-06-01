//
//  Double+l10n.swift
//  L10n
//
//  Created by Adrian Bobrowski on 08.05.2017.
//  Copyright © 2017 Coding lifestyle. All rights reserved.
//

extension Double {

    /**
     Returns a localized self description value.

     - returns: A localized self description value.
     */
    public func l10n() -> String {
        return (self as NSNumber).l10n()
    }

    /**
     Returns a localized self description value.

     - parameter fractionDigits: The number of fraction digits.

     - returns: A localized self description value.
     */
    public func l10n(fractionDigits: Int) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = fractionDigits
        formatter.maximumFractionDigits = fractionDigits
        formatter.locale = L10n.shared.locale
        return formatter.string(from: self as NSNumber)!
    }
}
