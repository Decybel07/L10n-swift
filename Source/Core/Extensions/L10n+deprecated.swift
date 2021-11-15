//
//  L10n+deprecated.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 15/11/2021.
//  Copyright © 2021 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

extension L10n {

    /**
     Returns a localized plural version of the string designated by the specified `key` and residing in `resource`.
     - parameter key: The key for a string in resource.
     - parameter resource: The receiver’s string resource to search. If resource is nil or is an empty string, the method attempts to use the resource in **Localizable** files.
     - parameter fittingWidth: The desired width of the string variation.
     - parameter arg: The values for which the appropriate plural form is selected.
     - parameter converting: A closure used to modify the number to display it to the user.
     - returns: A localized plural version of the string designated by `key`. This method returns `key` when `key` not found or `arg` is not a number .
     */
    @available(*, deprecated, renamed: "plural(for:resource:fittingWidth:_:)")
    open func plural<Number: Numeric & CVarArg>(for key: String, resource: String? = nil, fittingWidth: Int? = nil, arg: Number, converting: @escaping (_ number: Number) -> CVarArg = { $0 }) -> String {
        guard let arg = NumericPluralArg(arg: arg, converting: converting) else {
            self.logger?.info("L10n - Argument \(key.debugDescription) is not a number.")
            return key
        }
        return self.plural(for: key, resource: resource, fittingWidth: fittingWidth, args: [arg])
    }
}
