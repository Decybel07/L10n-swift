//
//  String+Localizable.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 30.04.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

extension String: Localizable {

    /**
     Returns a localized version of the string designated by `self` and residing in **Localizable**.

     - parameter instance: The instance of `L10n` used for localization.

     - returns: A localized version of the string designated by `self` or `self` if not found.
     */
    public func l10n(_ instance: L10n) -> String {
        return instance.string(for: self)
    }

    /**
     Returns a localized version of the string designated by the `self` and residing in `resource`.

     - parameter instance: The instance of `L10n` used for localization.
     - parameter resource: The receiver’s string resource to search. If resource is nil or is an empty string, the method attempts to use the resource in **Localizable** files.

     - returns: A localized version of the string designated by `self` or `self` if not found.
     */
    public func l10n(_ instance: L10n = .shared, resource: String?) -> String {
        return instance.string(for: self, resource: resource)
    }

    /**
     Returns a localized plural version of the string designated by `self` and residing in *resource*.

     - parameter instance: The instance of `L10n` used for localization.
     - parameter arg: The value for which the appropriate plural form is selected.

     - returns: A localized plural version of the string designated by `self` or `self` if not found.
     */
    public func l10n(_ instance: L10n = .shared, resource: String? = nil, arg: CVarArg) -> String {
        return instance.plural(for: self, resource: resource, arg: arg)
    }
}
