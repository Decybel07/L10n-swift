//
//  String+l10n.swift
//  L10n
//
//  Created by Adrian Bobrowski on 30.04.2017.
//  Copyright © 2017 Coding lifestyle. All rights reserved.
//

extension String: Localizable {

    /**
     Returns a localized version of the string designated by **self**.

     - returns: A localized version of the string designated by **self** or **self** if key not found.
     */
    public func l10n() -> String {
        return L10n.shared.string(for: self)
    }

    /**
     Returns a localized plural version of the string designated by **self**.

     - Attention: **Never use NSNumber as argument in args!**

     - parameter args: The values for which the appropriate plural form is selected.

     - returns: A localized plural version of the string designated by **self** or **self** if key not found.
     */
    public func l10n(_ args: Localizable...) -> String {
        return self.l10n(args)
    }

    /**
     Returns a localized plural version of the string designated by **self**.

     - Attention: **Never use NSNumber as argument in args!**

     - parameter args: The values for which the appropriate plural form is selected.

     - returns: A localized plural version of the string designated by **self** or **self** if key not found.
     */
    public func l10n(_ args: [Localizable]) -> String {
        return L10n.shared.plural(for: self, args)
    }
}
