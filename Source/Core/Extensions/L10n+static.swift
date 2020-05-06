//
//  L10n+static.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 29.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

public extension L10n {

    /// A shared instance of `L10n`.
    ///
    /// This instance is used in extensions
    static var shared: L10n = {
        let instance = L10n()
        L10n.preferredLanguage = instance.language
        return instance
    }()

    /// A preferred language contained in the main bundle.
    static var preferredLanguage: String {
        get { return Bundle.main.preferredLanguage }
        set { Bundle.main.preferredLanguage = newValue }
    }

    /// A list of all the languages contained in the main bundle.
    static var supportedLanguages: [String] {
        return Bundle.main.supportedLanguages
    }
}
