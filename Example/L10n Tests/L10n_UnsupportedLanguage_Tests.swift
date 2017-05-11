//
//  L10n_UnsupportedLanguage_Tests.swift
//  L10n Tests
//
//  Created by Adrian Bobrowski on 10.05.2017.
//  Copyright © 2017 Coding lifestyle. All rights reserved.
//

import XCTest
@testable import L10n

class L10n_UnsupportedLanguage_Tests: XCTestCase {

    override class func setUp() {
        super.setUp()

        L10n.shared.language = "Any unsupported language"
    }

    func testDefinedKey() {
        let key = "HelloWorld"

        XCTAssertEqual(key.l10n(), key)
    }

    func testUndefinedKey() {
        let key = "AnyUndefinedKey"

        XCTAssertEqual(key.l10n(), key)
    }

    func testDefinedGroupKeyValue() {
        let key = "language"

        XCTAssertEqual(key.l10n(), key)
    }

    func testDefinedGroupKey() {
        let key = "language.english"

        XCTAssertEqual(key.l10n(), key)
    }

    func testUndefinedGroupKey() {
        let key = "any.undefined.key"

        XCTAssertEqual(key.l10n(), key)
    }

    func testDefinedPlural() {
        let key = "numberOfApples"

        XCTAssertEqual(key.l10n(0), key)
        XCTAssertEqual(key.l10n(1), key)
        XCTAssertEqual(key.l10n(15), key)
    }

    func testUndefinedPlural() {
        let key = "anyUndefinedPlural"

        XCTAssertEqual(key.l10n(0), key)
        XCTAssertEqual(key.l10n(1), key)
        XCTAssertEqual(key.l10n(15), key)
    }

}
