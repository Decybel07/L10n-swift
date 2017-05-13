//
//  L10n.swift
//  L10n
//
//  Created by Adrian Bobrowski on 30.04.2017.
//  Copyright © 2017 Coding lifestyle. All rights reserved.
//

import Foundation

/// Class L10n.
public class L10n {

    /// A single shared instance of L10n.
    public static let shared = L10n()

    /// A preferred language contained in the main bundle.
    public static var preferredLanguage: String {
        return self.supportedLanguages.first ?? "UNDEFINED"
    }

    /// An ordered list of preferred languages contained in the main bundle.
    public static var preferredLanguages: [String] {
        return Bundle.main.preferredLocalizations
    }

    /// A list of all the languages contained in the main bundle.
    public static var supportedLanguages: [String] {
        return Bundle.main.localizations
    }

    /// Current language code.
    public var language: String {
        didSet {
            guard self.language != oldValue else {
                return
            }
            self.locale = nil
            self.bundle = nil
            self.stringsdict = nil
            self.plist = nil
            self.languageChanged()
        }
    }

    /// Current locale.
    private(set) public var locale: Locale?
    private var stringsdict: NSDictionary?
    private var plist: NSDictionary?
    private var bundle: Bundle?

    /**
     Returns a localized version of the string designated by the specified key and residing in loaded *Localizable* files.

     - parameter key: The key for a string in *Localizable* files.

     - returns: A localized version of the string designated by key. This method returns key when key not found.
     */
    public func string(for key: String) -> String {
        let value = self.stringFromDictionary(stringsdict, for: key)
            ?? self.stringFromDictionary(plist, for: key)
            ?? self.stringFromBundle(for: key)

        guard let text = value else {

            #if DEBUG
                print("[WARNING] L10n - Key \"\(key)\" does not exist for \"\(self.language)\"")
            #endif

            return key
        }
        return text
    }

    /**
     Returns a localized by using `format` as a template into which the remaining argument values are substituted.

     - parameter format: The template for arguments.
     - parameter args: The values used in the template.

     - returns: A localized by using `format` as a template into which the remaining argument values are substituted.
     */
    public func string(format: String, _ args: CVarArg...) -> String {
        return self.string(format: format, args)
    }

    /**
     Returns a localized by using `format` as a template into which the remaining argument values are substituted.

     - parameter format: The template for arguments.
     - parameter args: The values used in the template.

     - returns: A localized by using `format` as a template into which the remaining argument values are substituted.
     */
    public func string(format: String, _ args: [CVarArg]) -> String {
        return String(format: format, locale: self.locale, arguments: args)
    }

    /**
     Returns a localized plural version of the string designated by the specified key and residing in loaded *Localizable* files.

     - parameter key: The key for a string in "Localizable" files.
     - parameter args: The values for which the appropriate plural form is selected.

     - returns: A localized plural version of the string designated by key. This method returns key when key not found.
     */
    public func plural(for key: String, _ args: CVarArg...) -> String {
        return self.plural(for: key, args)
    }

    /**
     Returns a localized plural version of the string designated by the specified key and residing in loaded *Localizable* files.

     - parameter key: The key for a string in "Localizable" files.
     - parameter args: The values for which the appropriate plural form is selected.

     - returns: A localized plural version of the string designated by key. This method returns key when key not found.
     */
    public func plural(for key: String, _ args: [CVarArg]) -> String {
        return self.string(format: self.string(for: key), args)
    }

    /**
     Initializes a new L10n with the provided language.

     - parameter language: The initialize language.

     - returns: A L10n object for language.
     */
    public init(language: String) {
        self.language = language
        self.languageChanged()
    }

    private convenience init() {
        self.init(language: L10n.preferredLanguage)
    }

    private func stringFromBundle(for key: String) -> String? {
        guard let text = self.bundle?.localizedString(forKey: key, value: nil, table: nil), !text.isEmpty else {
            return nil
        }
        return text
    }

    private func stringFromDictionary(_ dictionary: NSDictionary?, for key: String) -> String? {
        if var node = dictionary?.value(forKeyPath: key) {
            if let value = (node as? NSDictionary)?.value(forKey: "value") {
                node = value
            }
            if let text = node as? String {
                return text
            }
        }
        return nil
    }
    
    private func languageChanged() {
        guard L10n.supportedLanguages.contains(self.language) else {
            
            #if DEBUG
                print("[ERROR] L10n - List of supported languages does not contain \"\(self.language)\"")
            #endif
            
            return
        }
        
        self.locale = self.createLocale()
        self.bundle = self.createBundle()
        self.stringsdict = self.createStringsdict()
        self.plist = self.createPlist()
    }
    
    private func createLocale() -> Locale? {
        return Locale(identifier: self.language)
    }
    
    private func createBundle() -> Bundle? {
        guard let path = Bundle.main.path(forResource: self.language, ofType: "lproj") else {
            return nil
        }
        return Bundle(path: path)
    }
    
    private func createPlist() -> NSDictionary? {
        return self.createDictionary(type: "plist")
    }
    
    private func createStringsdict() -> NSDictionary? {
        return self.createDictionary(type: "stringsdict")
    }
    
    private func createDictionary(type: String) -> NSDictionary? {
        guard let path = self.bundle?.path(forResource: "Localizable", ofType: type) else {
            return nil
        }
        return NSDictionary(contentsOfFile: path)
    }
}
