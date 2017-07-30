//
//  L10nTests.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 29.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import XCTest
@testable import L10n_swift

class L10nTests: XCTestCase {

    let (bundle, l10n): (Bundle, L10n) = {
        let bundle = Bundle(for: L10nTests.self)
        return (bundle, L10n(bundle: bundle))
    }()

    func testPreferredLanguage() {
        XCTAssertEqual(self.bundle.preferredLocalizations.first ?? "", self.l10n.preferredLanguage)
    }

    func testPreferredLanguages() {
        XCTAssertGreaterThanOrEqual(1, self.l10n.preferredLanguages.count)
        XCTAssertEqual(self.bundle.preferredLocalizations, self.l10n.preferredLanguages)
    }

    func testSupportedLanguages() {
        XCTAssertEqual(["ar", "en", "es", "ja", "pl"], self.l10n.supportedLanguages)
    }

    func testLanguage() {
        self.testLanguage("ar", isValid: true)
        self.testLanguage("en", isValid: true)
        self.testLanguage("🐒", isValid: false)
        self.testLanguage("es", isValid: true)
        self.testLanguage("ja", isValid: true)
        self.testLanguage("", isValid: false)
        self.testLanguage("pl", isValid: true)
    }

    func testLanguage(_ language: String, isValid: Bool) {
        self.l10n.language = language
        XCTAssertEqual(language, self.l10n.language)
        if isValid {
            XCTAssertNotNil(self.l10n.locale)
            XCTAssertNotNil(self.l10n.bundle)
        } else {
            XCTAssertNil(self.l10n.locale)
            XCTAssertNil(self.l10n.bundle)
        }
    }
}
