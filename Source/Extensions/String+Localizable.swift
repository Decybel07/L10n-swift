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
     Returns a localized version of the string designated by the `self`, residing in `resource` and filled with the values of the arguments.

     - parameter instance: The instance of `L10n` used for localization.
     - parameter resource: The receiver’s string resource to search. If resource is nil or is an empty string, the method attempts to use the resource in **Localizable** files.
     - parameter fittingWidth: The desired width of the string variation.

     - returns: A localized version of the string designated by `self` or `self` if not found.
     */
    public func l10n(_ instance: L10n = .shared, resource: String? = nil, fittingWidth: Int? = nil) -> String {
        return instance.string(for: self, resource: resource, fittingWidth: fittingWidth)
    }
    
    /**
     Returns a localized version of the string designated by the `self`, residing in `resource` and filled with the values of the arguments.

     - parameter instance: The instance of `L10n` used for localization.
     - parameter resource: The receiver’s string resource to search. If resource is nil or is an empty string, the method attempts to use the resource in **Localizable** files.
     - parameter fittingWidth: The desired width of the string variation.
     - parameter arg: The value used to fill.

     - returns: A localized version of the string designated by `self` or `self` if not found.
     */
    public func l10n(instance: L10n = .shared, resource: String? = nil, fittingWidth: Int? = nil, _ args: CVarArg...) -> String {
        return self.l10n(instance, resource: resource, fittingWidth: fittingWidth, args: args)
    }
    
    /**
     Returns a localized version of the string designated by the `self`, residing in `resource` and filled with the values of the arguments.

     - parameter instance: The instance of `L10n` used for localization.
     - parameter resource: The receiver’s string resource to search. If resource is nil or is an empty string, the method attempts to use the resource in **Localizable** files.
     - parameter fittingWidth: The desired width of the string variation.
     - parameter args: The values used to fill.

     - returns: A localized version of the string designated by `self` or `self` if not found.
     */
    public func l10n(_ instance: L10n = .shared, resource: String? = nil, fittingWidth: Int? = nil, args: [CVarArg]) -> String {
        let localizedFormat = instance.string(for: self, resource: resource, fittingWidth: fittingWidth)
        return args.isEmpty ? localizedFormat : instance.string(format: localizedFormat, args: args)
    }
    

    /**
     Returns a localized plural version of the string designated by the specified `self` and `args` and residing in `resource`.

     - parameter instance: The instance of `L10n` used for localization.
     - parameter resource: The receiver’s string resource to search. If resource is nil or is an empty string, the method attempts to use the resource in **Localizable** files.
     - parameter fittingWidth: The desired width of the string variation.
     - parameter args: The values for which the appropriate plural form is selected. If you want to modify the argument to be displayed, use `PluralArg` (eg. `NumericPluralArg`).

     - returns: A localized plural version of the string designated by `key`. This method returns `key` when `key` not found.
     */
    public func l10nPlural(instance: L10n = .shared, resource: String? = nil, fittingWidth: Int? = nil, _ args: CVarArg...) -> String {
        return self.l10nPlural(instance, resource: resource, fittingWidth: fittingWidth, args: args)
    }
    
    /**
     Returns a localized plural version of the string designated by the specified `self` and `args` and residing in `resource`.

     - parameter instance: The instance of `L10n` used for localization.
     - parameter resource: The receiver’s string resource to search. If resource is nil or is an empty string, the method attempts to use the resource in **Localizable** files.
     - parameter fittingWidth: The desired width of the string variation.
     - parameter args: The values for which the appropriate plural form is selected. If you want to modify the argument to be displayed, use `PluralArg` (eg. `NumericPluralArg`).

     - returns: A localized plural version of the string designated by `key`. This method returns `key` when `key` not found.
     */
    public func l10nPlural(_ instance: L10n = .shared, resource: String? = nil, fittingWidth: Int? = nil, args: [CVarArg]) -> String {
        return instance.plural(for: self, resource: resource, fittingWidth: fittingWidth, args: args)
    }
}

// MARK: - Deprecated

extension String {

    /**
     Returns a localized plural version of the string designated by `self` and residing in *resource*.
     - parameter instance: The instance of `L10n` used for localization.
     - parameter fittingWidth: The desired width of the string variation.
     - parameter arg: The value for which the appropriate plural form is selected.
     - parameter converting: A closure used to modify the number to display it to the user.
     - returns: A localized plural version of the string designated by `self` or `self` if not found.
     */
    @available(*, deprecated, renamed: "l10nPlural(_:resource:fittingWidth:_:)")
    public func l10n<Number: Numeric & CVarArg>(_ instance: L10n = .shared, resource: String? = nil, fittingWidth: Int? = nil, arg: Number, converting: @escaping (_ number: Number) -> CVarArg = { $0 }) -> String {
        return instance.plural(for: self, resource: resource, fittingWidth: fittingWidth, arg: arg, converting: converting)
    }
}
