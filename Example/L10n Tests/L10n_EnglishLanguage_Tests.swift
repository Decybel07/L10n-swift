//
//  L10n_EnglishLanguage_Tests.swift
//  L10n Tests
//
//  Created by Adrian Bobrowski on 11.05.2017.
//  Copyright © 2017 Coding lifestyle. All rights reserved.
//

import XCTest
@testable import L10n

class L10n_EnglishLanguage_Tests: XCTestCase {

    override class func setUp() {
        super.setUp()

        L10n.shared.language = "en"
    }

    func testDefinedKey() {
        let key = "HelloWorld"

        XCTAssertNotEqual(key.l10n(), key)
        XCTAssertEqual(key.l10n(), "Hello World!")
    }

    func testUndefinedKey() {
        let key = "AnyUndefinedKey"

        XCTAssertEqual(key.l10n(), key)
    }

    func testDefinedGroupKeyValue() {
        let key = "language"

        XCTAssertNotEqual(key.l10n(), key)
        XCTAssertEqual(key.l10n(), "Language")
    }

    func testDefinedGroupKey() {
        let key = "language.english"

        XCTAssertNotEqual(key.l10n(), key)
        XCTAssertEqual(key.l10n(), "English")
    }

    func testUndefinedGroupKey() {
        let key = "any.undefined.key"

        XCTAssertEqual(key.l10n(), key)
    }

    func testDefinedPlural() {
        let key = "numberOfApples"

        XCTAssertEqual(key.l10n(0), "Zero apples")
        XCTAssertEqual(key.l10n(1), "One apple")
        XCTAssertEqual(key.l10n(2), "2 apples")
        XCTAssertEqual(key.l10n(5), "5 apples")
        XCTAssertEqual(key.l10n(124), "124 apples")
    }

    func testDefinedPlural_tooManyParameters() {
        let key = "numberOfApples"

        XCTAssertEqual(key.l10n(0, 4, 3, 1), "Zero apples")
        XCTAssertEqual(key.l10n(1, 23), "One apple")
        XCTAssertEqual(key.l10n(2, 56), "2 apples")
        XCTAssertEqual(key.l10n(5), "5 apples")
        XCTAssertEqual(key.l10n(124), "124 apples")
    }

    func testUndefinedPlural() {
        let key = "anyUndefinedPlural"

        XCTAssertEqual(key.l10n(0), key)
        XCTAssertEqual(key.l10n(1), key)
        XCTAssertEqual(key.l10n(15), key)
    }

    func testInt() {
        XCTAssertEqual(0.l10n(), "0")
        XCTAssertEqual(1.l10n(), "1")
        XCTAssertEqual(15.l10n(), "15")
        XCTAssertEqual(7_215_633.l10n(), "7,215,633")
    }

    func testDouble() {
        XCTAssertEqual(0.0.l10n(), "0.0000")
        XCTAssertEqual(3.14.l10n(), "3.1400")
        XCTAssertEqual(4.651273.l10n(), "4.6513")
        XCTAssertEqual(4.651273.l10n(fractionDigits: 0), "5")
        XCTAssertEqual(4.651273.l10n(fractionDigits: 1), "4.7")
        XCTAssertEqual(4.651273.l10n(fractionDigits: 2), "4.65")
        XCTAssertEqual(4.651273.l10n(fractionDigits: 3), "4.651")
    }
}