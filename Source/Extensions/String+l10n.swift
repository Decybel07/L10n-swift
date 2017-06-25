//
//  String+l10n.swift
//  L10n
//
//  Created by Adrian Bobrowski on 30.04.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

extension String: Localizable {

    /**
     Returns a localized version of the string designated by **self** and residing in *Localizable*.

     - returns: A localized version of the string designated by **self** or **self** if key not found.
     */
    public func l10n() -> String {
        return L10n.shared.string(for: self)
    }

    /**
     Returns a localized version of the string designated by the **self** and residing in *resource*.

     - parameter resource: The receiver’s string resource to search. If resource is nil or is an empty string, the method attempts to use the resource in Localizable files.

     - returns: A localized version of the string designated by **self** or **self** if key not found.
     */
    public func string(resource: String?) -> String {
        return L10n.shared.string(for: self, resource: resource)
    }

    /**
     Returns a localized plural version of the string designated by **self** and residing in *resource*.

     - parameter args: The values for which the appropriate plural form is selected.

     - returns: A localized plural version of the string designated by **self** or **self** if key not found.
     */
    public func l10n(resource: String? = nil, _ args: CVarArg...) -> String {
        return self.l10n(resource: resource, args)
    }

    /**
     Returns a localized plural version of the string designated by **self** and residing in *resource*.

     - parameter args: The values for which the appropriate plural form is selected.

     - returns: A localized plural version of the string designated by **self** or **self** if key not found.
     */
    public func l10n(resource _: String? = nil, _ args: [CVarArg]) -> String {
        return L10n.shared.plural(for: self, args)
    }
}
