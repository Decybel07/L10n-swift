//
//  NSNumber+l10n.swift
//  L10n
//
//  Created by Adrian Bobrowski on 01.06.2017.
//  Copyright © 2017 Coding lifestyle. All rights reserved.
//

extension NSNumber: Localizable {

    /**
     Returns a string that represents the localized contents of the number object.

     - returns: A string that represents the localized contents of the number object.
     */
    public func l10n() -> String {
        return self.description(withLocale: L10n.shared.locale)
    }
}
