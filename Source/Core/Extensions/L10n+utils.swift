//
//  L10n+utils.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 15/11/2021.
//  Copyright © 2021 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

public extension L10n {

    /// Current language code.
    var language: String {
        get { return self.languageCode }
        set { self.languageCode = self.normalize(language: newValue) }
    }
    
    /// Fallback language code. It's used as a fallback when no other localization matches
    var fallbackLanguage: String {
        get { return self.fallbackLanguageCode }
        set { self.fallbackLanguageCode = self.normalize(language: newValue) }
    }
    
    private func normalize(language: String) -> String {
        if language == "Base", let developmentLanguage = self.coreBundle.developmentLocalization {
            return self.normalize(language: developmentLanguage)
        }
        if language.contains("_") {
            return self.normalize(language: language.replacingOccurrences(of: "_", with: "-"))
        }
        return language
    }
}
