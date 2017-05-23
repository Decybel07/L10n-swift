//
//  Int+l10n.swift
//  L10n
//
//  Created by Adrian Bobrowski on 08.05.2017.
//  Copyright © 2017 Coding lifestyle. All rights reserved.
//

extension Int {

    /**
     Returns a localized self description value.

     - returns: A localized self description value.
     */
    public func l10n() -> String {
        return L10n.shared.string(format: "%ld", self)
    }

    /**
     Returns a localized self description value with leading zeros.

     - returns: A localized self description value with leading zeros.
     */
    public func l10n(minIntegerDigits: Int) -> String {
        return L10n.shared.string(format: "%0\(minIntegerDigits)ld", self)
    }
}
