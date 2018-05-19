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
        return self.removeBase(self.preferredLocalizations).first
            ?? self.developmentLocalization
            ?? "Base"
    }

    var supportedLanguages: [String] {
        return self.removeBase(self.localizations)
    }

    func bundle(forLangage language: String) -> Bundle? {
        guard let path = self.path(forResource: language, ofType: "lproj") else {
            return nil
        }
        return Bundle(path: path)
    }

    private func removeBase(_ languages: [String]) -> [String] {
        guard let index = languages.index(of: "Base") else {
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
