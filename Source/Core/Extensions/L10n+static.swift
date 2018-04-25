//
//  L10n+static.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 29.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

public extension L10n {

    /// A single shared instance of `L10n`.
    ///
    /// This instance is used in extensions
    static var shared = L10n(language: L10n.preferredLanguage)

    /// A preferred language contained in the main bundle.
    static var preferredLanguage: String {
        return Bundle.main.preferredLocalizations.first ?? "UNDEFINED"
    }

    /// A list of all the languages contained in the main bundle.
    static var supportedLanguages: [String] {
        return Bundle.main.localizations
    }
}
