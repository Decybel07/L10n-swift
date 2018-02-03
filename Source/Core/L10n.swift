//
//  L10n.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 30.04.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

/**
 L10n manages the localized version of strings designated by the given `key` and located in the `resource` for the specified language. The default resources are **Localizable** files

 ## The L10n class provides information about:
 * supported languages for the application
 * the best matching language supported by applications with user preferences

 ## L10n objects provide information about:
 * current language code for object
 * locale for this language
 * closure used to log information from the framework

 Each object uses the default NotificationCenter to send notification when the language has changed.

 SeeAlso: `Notification.Name.L10nLanguageChanged`

 ## Supported files format:
 * [*.plist](https://github.com/Decybel07/L10n-swift/wiki/\*.plist)
 * [*.json](https://github.com/Decybel07/L10n-swift/wiki/\*.json)
 * [*.stringsdict](https://github.com/Decybel07/L10n-swift/wiki/\*.stringsdict)
 * [*.strings](https://github.com/Decybel07/L10n-swift/wiki/\*.strings)
 */
open class L10n {

    /// A preferred language contained in the base bundle.
    public var preferredLanguage: String {
        return self.baseBundle.preferredLocalizations.first ?? "UNDEFINED"
    }

    /// A list of all the languages contained in the base bundle.
    public var supportedLanguages: [String] {
        return self.baseBundle.localizations
    }

    /// A logger used to log information from the framework
    public var logger: Logger?

    /// Current language code.
    public var language: String {
        didSet {
            guard self.language != oldValue else {
                return
            }
            self.locale = nil
            self.bundle = nil
            self.resources = [:]
            self.languageChanged(oldValue: oldValue)
        }
    }

    /// Current locale.
    private(set) public var locale: Locale?

    /// Base bundle used for localization.
    private(set) public var bundle: Bundle?

    private var baseBundle: Bundle
    private var resources: [String: ResourceContainer] = [:]

    /**
     Initialize a new `L10n` with the provided language.

     - parameter language: The initialize language.

     - returns: A `L10n` object for language.
     */
    public init(bundle: Bundle = .main, language: String? = nil) {
        self.language = language ?? bundle.preferredLocalizations.first ?? "UNDEFINED"
        self.baseBundle = bundle
        self.languageChanged()
    }

    /**
     Returns a localized by using `format` as a template into which the remaining argument values are substituted.

     - parameter format: The template for arguments.
     - parameter args: The values used in the template.

     - returns: A localized by using `format` as a template into which the remaining argument values are substituted.
     */
    public func string(format: String, _ args: CVarArg...) -> String {
        return self.string(format: format, args: args)
    }

    /**
     Returns a localized by using `format` as a template into which the remaining argument values are substituted.

     - parameter format: The template for arguments.
     - parameter args: The values used in the template.

     - returns: A localized by using `format` as a template into which the remaining argument values are substituted.
     */
    open func string(format: String, args: [CVarArg]) -> String {
        return String(format: format, locale: self.locale, arguments: args)
    }

    /**
     Returns a localized version of the string designated by the specified `key` and residing in `resource`.

     - parameter key: The key for a string in resource.
     - parameter resource: The receiver’s string resource to search. If resource is nil or is an empty string, the method attempts to use the resource in **Localizable** files.

     - returns: A localized version of the string designated by `key`. This method returns `key` when `key` not found.
     */
    open func string(for key: String, resource: String? = nil) -> String {
        guard let text = self.resource(named: resource)[key] else {
            self.logger?.info("L10n - Key \(key.debugDescription) does not exist for \(self.language.debugDescription).")
            return key
        }
        return text
    }

    /**
     Returns a localized plural version of the string designated by the specified `key` and residing in `resource`.

     - parameter key: The key for a string in resource.
     - parameter resource: The receiver’s string resource to search. If resource is nil or is an empty string, the method attempts to use the resource in **Localizable** files.
     - parameter arg: The values for which the appropriate plural form is selected.

     - returns: A localized plural version of the string designated by `key`. This method returns `key` when `key` not found or `arg` is not a number .
     */
    open func plural(for key: String, resource: String? = nil, arg: CVarArg) -> String {
        guard let number = arg as? NSNumber else {
            self.logger?.info("L10n - Argument \(key.debugDescription) is not a number.")
            return key
        }

        let firstFormat = Plural.variants(for: number, with: self.locale).lazy.map { plural in
            self.resource(named: resource)["\(key).\(plural.rawValue)"]
        }.first { $0 != nil }

        guard let format = firstFormat else {
            self.logger?.info("L10n - Key \(key.debugDescription) does not support plural for \(self.language.debugDescription).")
            return key
        }
        return self.string(format: format!, arg)
    }

    /**
     Inject `dictionary` from an external source (eg internet) with translations into the `resource`.

     - parameter dictionary: A dictionary with translations that will be injected into the resource.
     - parameter resource: The receiver’s string resource to search. If resource is nil or is an empty string, the method attempts to use the **Localizable** resource.

     - Important:
     After changing the language, all the dictionary should be injected again.
     */
    open func inject(dictionary: [String: Any], into resource: String? = nil) {
        self.resource(named: resource).inject(dictionary: dictionary)
    }

    private func languageChanged(oldValue: String? = nil) {
        if self.supportedLanguages.contains(self.language) {
            if let path = self.baseBundle.path(forResource: self.language, ofType: "lproj"),
                let bundle = Bundle(path: path) {

                self.locale = Locale(identifier: self.language)
                self.bundle = bundle
            } else {
                self.logger?.info("L10n - Could not find the bundle for \(self.language.debugDescription).")
            }
        } else {
            self.logger?.info("L10n - List of supported languages does not contain \(self.language.debugDescription).")
        }

        if let oldValue = oldValue {
            NotificationCenter.default.post(name: .L10nLanguageChanged, object: self, userInfo: [
                "sender": self,
                "oldValue": oldValue,
                "newValue": self.language,
            ])
        }
    }

    private func resource(named resourceName: String?) -> ResourceContainer {
        let resourceName = (resourceName ?? "").isEmpty ? "Localizable" : resourceName!

        return self.resources[resourceName] ?? {
            let resource = ResourceContainer(bundle: self.bundle, name: resourceName)
            self.resources[resourceName] = resource
            return resource
        }()
    }
}
