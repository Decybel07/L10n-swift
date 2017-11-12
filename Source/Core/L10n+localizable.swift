//
//  L10n+Localizable.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 24.08.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

extension L10n: Localizable {

    /**
     Returns a localized language name for specified `L10n` instance.

     For example:
     * For "en-GB" language, the result is "English (United Kingdom)"
     * For "pl" language, the result is "polski"

     - parameter instance: The instance of `L10n` used for localization.
     */
    public func l10n(_ instance: L10n) -> String {
        return instance.locale?.localizedString(forIdentifier: self.language) ?? self.language
    }
}
