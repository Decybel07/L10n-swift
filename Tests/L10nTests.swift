//
//  L10nTests.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 19.05.2018.
//  Copyright © 2018 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import XCTest
@testable import L10n_swift

final class L10nTests: L10nBaseTest {

    func testPreferredLanguage() {
        XCTAssertEqual(self.bundle.preferredLocalizations.first ?? "Base", self.l10nInstance.preferredLanguage)
    }

    func testSupportedLanguages() {
        XCTAssertFalse(self.l10nInstance.supportedLanguages.contains("Base"))
        XCTAssertEqual(Set(["en", "pl"]), Set(self.l10nInstance.supportedLanguages))
    }

    func testSetDevelopmentLanguage() {
        if let developmentLanguage = self.bundle.developmentLocalization {
            self.l10nInstance.language = developmentLanguage
            XCTAssertEqual(developmentLanguage, self.l10nInstance.language)
            XCTAssertEqual(developmentLanguage, self.l10nInstance.locale?.identifier)
            XCTAssertEqual(1, self.l10nInstance.bundles.count)
            XCTAssertNotNil(self.l10nInstance.locale)
        }
    }

    func testSetBaseLanguage() {
        self.l10nInstance.language = "Base"

        if let developmentLanguage = self.bundle.developmentLocalization {
            XCTAssertEqual(developmentLanguage, self.l10nInstance.language)
            XCTAssertEqual(developmentLanguage, self.l10nInstance.locale?.identifier)
            XCTAssertEqual(1, self.l10nInstance.bundles.count)
            XCTAssertNotNil(self.l10nInstance.locale)
        } else {
            XCTAssertEqual("Base", self.l10nInstance.language)
            XCTAssertTrue(self.l10nInstance.bundles.isEmpty)
            XCTAssertNil(self.l10nInstance.locale)
        }
    }

    func testSetSuportedLanguage() {
        self.l10nInstance.language = "pl"
        XCTAssertEqual("pl", self.l10nInstance.language)
        XCTAssertEqual("pl", self.l10nInstance.locale?.identifier)
        XCTAssertEqual(2, self.l10nInstance.bundles.count)
        XCTAssertNotNil(self.l10nInstance.locale)
    }

    func testSetSuportedLanguageWithRegion() {
        self.l10nInstance.language = "pl_PL"
        XCTAssertEqual("pl-PL", self.l10nInstance.language)
        XCTAssertEqual("pl-PL", self.l10nInstance.locale?.identifier)
        XCTAssertEqual(2, self.l10nInstance.bundles.count)
        XCTAssertNotNil(self.l10nInstance.locale)
    }

    func testSetUnsuportedLanguage() {
        self.l10nInstance.language = "es"
        XCTAssertEqual("es", self.l10nInstance.language)
        XCTAssertEqual("es", self.l10nInstance.locale?.identifier)
        XCTAssertEqual(1, self.l10nInstance.bundles.count)
        XCTAssertNotNil(self.l10nInstance.locale)
    }

    func testSetUndefinedLanguage() {
        self.l10nInstance.language = "🐒"
        XCTAssertEqual("🐒", self.l10nInstance.language)
        XCTAssertTrue(self.l10nInstance.bundles.isEmpty)
        XCTAssertNil(self.l10nInstance.locale)
    }

    func testInject() {
        self.l10nInstance.language = "en"
        XCTAssertEqual("stringsdict", self.l10nInstance.string(for: "resource"))

        self.l10nInstance.inject(dictionary: ["resource": "Custom"])
        XCTAssertEqual("Custom", self.l10nInstance.string(for: "resource"))
        XCTAssertEqual("resource.value", self.l10nInstance.string(for: "resource.value"))

        self.l10nInstance.inject(dictionary: ["resource.group": "Group"])
        XCTAssertEqual("Custom", self.l10nInstance.string(for: "resource"))
        XCTAssertEqual("Custom", self.l10nInstance.string(for: "resource.value"))
        XCTAssertEqual("Group", self.l10nInstance.string(for: "resource.group"))
    }
}
