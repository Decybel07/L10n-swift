//
//  L10nPluralTests.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 19.05.2018.
//  Copyright © 2018 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import XCTest
@testable import L10n_swift

final class L10nPluralTests: L10nBaseTest {

    func testPluralDevelopmentLanguage() {
        if let developmentLanguage = self.bundle.developmentLocalization {
            self.l10nInstance.language = developmentLanguage
            self.checkBaseEnglishPlurals()
        }
    }

    func testPluralBaseLanguage() {
        self.l10nInstance.language = "Base"
        self.checkBaseEnglishPlurals()
    }

    func testPluralSupportedLanguage() {
        self.l10nInstance.language = "pl"
        self.checkSupportedPolishPlurals()
    }

    func testPluralSupportedLanguageWithRegion() {
        self.l10nInstance.language = "pl_PL"
        self.checkSupportedPolishPlurals()
    }

    func testPluralUnSupportedLanguage() {
        self.l10nInstance.language = "es"
        self.checkBaseEnglishPlurals()
    }

    func testPluralUndefinedLanguage() {
        self.l10nInstance.language = "🐒"
        self.checkUndefinedLanguagePlurals()
    }

    private func checkBaseEnglishPlurals() {
        self.checkPlurals([
            (key: "numberOfApples", value: 0, expected: "Zero apples"),
            (key: "numberOfApples", value: 1, expected: "One apple"),
            (key: "numberOfApples", value: 2, expected: "2 apples"),
            (key: "numberOfApples", value: 5, expected: "5 apples"),
            (key: "numberOfApples", value: 8, expected: "8 apples"),
            (key: "numberOfPears", value: 0, expected: "Zero pears"),
            (key: "numberOfPears", value: 1, expected: "One pear"),
            (key: "numberOfPears", value: 2, expected: "2 pears"),
            (key: "numberOfPears", value: 5, expected: "5 pears"),
            (key: "numberOfPears", value: 8, expected: "8 pears"),
            (key: "numberOfBananas", value: 123, expected: "numberOfBananas"),
        ])
    }

    private func checkSupportedPolishPlurals() {
        self.checkPlurals([
            (key: "numberOfApples", value: 0, expected: "Zero jabłek"),
            (key: "numberOfApples", value: 1, expected: "Jedno jabłko"),
            (key: "numberOfApples", value: 2, expected: "2 jabłka"),
            (key: "numberOfApples", value: 5, expected: "5 jabłek"),
            (key: "numberOfApples", value: 8, expected: "8 jabłek"),
            (key: "numberOfPears", value: 0, expected: "Zero gruszek"),
            (key: "numberOfPears", value: 1, expected: "Jedna gruszka"),
            (key: "numberOfPears", value: 2, expected: "2 gruszki"),
            (key: "numberOfPears", value: 5, expected: "5 gruszek"),
            (key: "numberOfPears", value: 8, expected: "8 gruszek"),
            (key: "numberOfBananas", value: 123, expected: "numberOfBananas"),
        ])
    }

    private func checkUndefinedLanguagePlurals() {
        self.checkPlurals([
            (key: "numberOfApples", value: 0, expected: "numberOfApples"),
            (key: "numberOfApples", value: 1, expected: "numberOfApples"),
            (key: "numberOfApples", value: 2, expected: "numberOfApples"),
            (key: "numberOfApples", value: 5, expected: "numberOfApples"),
            (key: "numberOfApples", value: 8, expected: "numberOfApples"),
            (key: "numberOfPears", value: 0, expected: "numberOfPears"),
            (key: "numberOfPears", value: 1, expected: "numberOfPears"),
            (key: "numberOfPears", value: 2, expected: "numberOfPears"),
            (key: "numberOfPears", value: 5, expected: "numberOfPears"),
            (key: "numberOfPears", value: 8, expected: "numberOfPears"),
            (key: "numberOfBananas", value: 123, expected: "numberOfBananas"),
        ])
    }

    private func checkPlurals(_ array: [(key: String, value: Int, expected: String)]) {
        array.forEach { key, value, expected in
            print(expected, key.l10nPlural(self.l10nInstance, [value]))
            //            XCTAssertEqual(expected, key.l10nPlural(self.l10nInstance, value))
            //            XCTAssertEqual(expected, self.l10nInstance.plural(for: key, value))
        }
    }
}
