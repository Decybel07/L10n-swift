//
//  L10nStringTests.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 19.05.2018.
//  Copyright © 2018 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import XCTest
@testable import L10n_swift

final class L10nStringTests: L10nBaseTest {

    func testStringDevelopmentLanguage() {
        if let developmentLanguage = self.bundle.developmentLocalization {
            self.l10nInstance.language = developmentLanguage
            self.checkBaseEnglishStrings()
        }
    }

    func testStringBaseLanguage() {
        self.l10nInstance.language = "Base"
        self.checkBaseEnglishStrings()
    }

    func testStringSupportedLanguage() {
        self.l10nInstance.language = "pl"
        self.checkSupportedPolishStrings()
    }

    func testStringSupportedLanguageWithRegion() {
        self.l10nInstance.language = "pl_PL"
        self.checkSupportedPolishStrings()
    }

    func testStringUnSupportedLanguage() {
        self.l10nInstance.language = "es"
        self.checkBaseEnglishStrings()
    }

    func testStringUndefinedLanguage() {
        self.l10nInstance.language = "🐒"
        self.checkUndefinedLanguageStrings()
    }

    private func checkBaseEnglishStrings() {
        self.checkStrings([
            (key: "language", expected: "Language"),
            (key: "language.value", expected: "Language"),
            (key: "language.current", expected: "English"),
            (key: "hello.world", expected: "Hello World!"),
            (key: "hello.world.deeper", expected: "hello.world.deeper"),
            (key: "parameters", expected: "parameters"),
            (key: "other", expected: "other"),
        ])
    }

    private func checkSupportedPolishStrings() {
        self.checkStrings([
            (key: "language", expected: "Język"),
            (key: "language.value", expected: "Język"),
            (key: "language.current", expected: "Polski"),
            (key: "hello.world", expected: "Witaj świecie!"),
            (key: "hello.world.deeper", expected: "hello.world.deeper"),
            (key: "parameters", expected: "parameters"),
            (key: "other", expected: "other"),
        ])
    }

    private func checkUndefinedLanguageStrings() {
        self.checkStrings([
            (key: "language", expected: "language"),
            (key: "language.value", expected: "language.value"),
            (key: "language.current", expected: "language.current"),
            (key: "hello.world", expected: "hello.world"),
            (key: "hello.world.deeper", expected: "hello.world.deeper"),
            (key: "parameters", expected: "parameters"),
            (key: "other", expected: "other"),
        ])
    }

    private func checkStrings(_ array: [(key: String, expected: String)]) {
        array.forEach { key, expected in
            XCTAssertEqual(expected, key.l10n(self.l10nInstance))
            XCTAssertEqual(expected, self.l10nInstance.string(for: key))
        }
    }
}
