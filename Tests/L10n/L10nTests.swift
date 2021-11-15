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
        XCTAssertEqual(Set(["ar", "en", "pl"]), Set(self.l10nInstance.supportedLanguages))
    }

    func testSetDevelopmentLanguage() {
        if let developmentLanguage = self.bundle.developmentLocalization {
            self.l10nInstance.language = developmentLanguage
            XCTAssertEqual(developmentLanguage, self.l10nInstance.language)
            XCTAssertEqual(developmentLanguage, self.l10nInstance.locale?.languageCode)
            XCTAssertEqual("US", self.l10nInstance.locale?.regionCode)
            XCTAssertEqual(2, self.l10nInstance.bundles.count)
            XCTAssertNotNil(self.l10nInstance.locale)
        }
    }

    func testSetBaseLanguage() {
        self.l10nInstance.language = "Base"

        if let developmentLanguage = self.bundle.developmentLocalization {
            XCTAssertEqual(developmentLanguage, self.l10nInstance.language)
            XCTAssertEqual(developmentLanguage, self.l10nInstance.locale?.languageCode)
            XCTAssertEqual("US", self.l10nInstance.locale?.regionCode)
            XCTAssertEqual(2, self.l10nInstance.bundles.count)
            XCTAssertNotNil(self.l10nInstance.locale)
        }
    }

    func testSetSupportedLanguage() {
        self.l10nInstance.language = "pl"
        XCTAssertEqual("pl", self.l10nInstance.language)
        XCTAssertEqual("pl-US", self.l10nInstance.locale?.identifier)
        XCTAssertEqual(3, self.l10nInstance.bundles.count)
        XCTAssertNotNil(self.l10nInstance.locale)
    }

    func testSetSupportedLanguageWithRegion() {
        self.l10nInstance.language = "pl_PL"
        XCTAssertEqual("pl-PL", self.l10nInstance.language)
        XCTAssertEqual("pl-PL", self.l10nInstance.locale?.identifier)
        XCTAssertEqual(3, self.l10nInstance.bundles.count)
        XCTAssertNotNil(self.l10nInstance.locale)
    }

    func testSetUnSupportedLanguage() {
        self.l10nInstance.language = "es"
        XCTAssertEqual("es", self.l10nInstance.language)
        XCTAssertEqual("es-US", self.l10nInstance.locale?.identifier)
        XCTAssertEqual(2, self.l10nInstance.bundles.count)
        XCTAssertNotNil(self.l10nInstance.locale)
    }

    func testSetUndefinedLanguage() {
        self.l10nInstance.language = "🐒"
        XCTAssertEqual("🐒", self.l10nInstance.language)
        XCTAssertEqual(2, self.l10nInstance.bundles.count)
        XCTAssertNotNil(self.l10nInstance.locale)
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
    
    func testNonLocalized() {
        self.l10nInstance.configuration.isNonLocalized = true
        XCTAssertEqual("resource", self.l10nInstance.string(for: "resource"))
        XCTAssertEqual("numberOfApples", self.l10nInstance.plural(for: "numberOfApples", 5))
    }
    
    func testLocalizedWithDoubleLength() {
        self.l10nInstance.configuration.isDoubleLength = true
        XCTAssertEqual("Hello World! Hello World!", self.l10nInstance.string(for: "hello.world"))
        XCTAssertEqual("5 apples 5 apples", self.l10nInstance.plural(for: "numberOfApples", 5))
    }
    
    func testLocalizedWithAccented() {
        self.l10nInstance.configuration.isAccented = true
        XCTAssertEqual("Ḣ̜ȅ̤l̮̓l̮̓ó̱ W̤͊ó̱r̜̄l̮̓d̜̎!", self.l10nInstance.string(for: "hello.world"))
        XCTAssertEqual("5 a̱̋p̖̂p̖̂l̮̓ȅ̤s̤̆", self.l10nInstance.plural(for: "numberOfApples", 5))
    }
    
    func testLocalizedWithBounded() {
        self.l10nInstance.configuration.isBounded = true
        XCTAssertEqual("[# Hello World! #]", self.l10nInstance.string(for: "hello.world"))
        XCTAssertEqual("[# 5 apples #]", self.l10nInstance.plural(for: "numberOfApples", 5))
    }
    
    func testLocalizedWithForcedRightToLeft() {
        self.l10nInstance.configuration.isForcedRightToLeft = true
        XCTAssertEqual("!dlroW olleH", self.l10nInstance.string(for: "hello.world"))
        XCTAssertEqual("selppa 5", self.l10nInstance.plural(for: "numberOfApples", 5))
    }
    
    func testLocalizedWithAllDecorators() {
        self.l10nInstance.configuration = .init(
            isDoubleLength: true, isAccented: true, isBounded: true, isForcedRightToLeft: true
        )
        XCTAssertEqual("[# !d̜̎l̮̓r̜̄ó̱W̤͊ ó̱l̮̓l̮̓ȅ̤Ḣ̜ !d̜̎l̮̓r̜̄ó̱W̤͊ ó̱l̮̓l̮̓ȅ̤Ḣ̜ #]", self.l10nInstance.string(for: "hello.world"))
        XCTAssertEqual("[# s̤̆ȅ̤l̮̓p̖̂p̖̂a̱̋ 5 s̤̆ȅ̤l̮̓p̖̂p̖̂a̱̋ 5 #]", self.l10nInstance.plural(for: "numberOfApples", 5))
    }
}
