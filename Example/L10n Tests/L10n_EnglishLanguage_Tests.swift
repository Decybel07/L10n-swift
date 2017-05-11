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

}
