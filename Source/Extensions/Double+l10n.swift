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
     
     - parameter fractionDigits: The number of fraction digits.
     
     - returns: A localized self description value.
     */
    public func l10n(fractionDigits: UInt = 4) -> String {
        return L10n.shared.string(format: "%.\(fractionDigits)f", self)
    }

}
