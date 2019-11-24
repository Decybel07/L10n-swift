//
//  Bundle+utils.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 17.05.2018.
//  Copyright © 2018 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

internal extension Bundle {

    var preferredLanguage: String {
        get {
            return self.preferredLanguages.first
            ?? self.developmentLocalization
            ?? "Base"
        }
        set {
            var preferredLanguages = Bundle.main.preferredLanguages
            #if swift(>=4.2)
                let firstIndex = preferredLanguages.firstIndex(of: newValue)
            #else
                let firstIndex = preferredLanguages.index(of: newValue)
            #endif
            
            if let index = firstIndex {
                guard index > 0 else {
                    return
                }
                preferredLanguages.remove(at: index)
            }
            UserDefaults.standard.set([newValue] + preferredLanguages, forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
        }
    }

    var preferredLanguages: [String] {
        return self.removeBase(self.preferredLocalizations)
    }
    
    var supportedLanguages: [String] {
        return self.removeBase(self.localizations)
    }

    func bundle(forLanguage language: String) -> Bundle? {
        guard let path = self.path(forResource: language, ofType: "lproj") else {
            return nil
        }
        return Bundle(path: path)
    }

    private func removeBase(_ languages: [String]) -> [String] {
        #if swift(>=4.2)
            let firstIndex = languages.firstIndex(of: "Base")
        #else
            let firstIndex = languages.index(of: "Base")
        #endif
        
        guard let index = firstIndex else {
            return languages
        }

        var result = languages
        if let developmentLanguage = self.developmentLocalization, !result.contains(developmentLanguage) {
            result[index] = developmentLanguage
        } else {
            result.remove(at: index)
        }
        return result
    }
}
