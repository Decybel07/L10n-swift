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

    func testInt() {
        XCTAssertEqual(0.l10n(), "0")
        XCTAssertEqual(1.l10n(), "1")
        XCTAssertEqual(15.l10n(), "15")
        XCTAssertEqual(7_215_633.l10n(), "7215633")
        
        XCTAssertEqual(0.l10n(minIntegerDigits: 3), "000")
        XCTAssertEqual(1.l10n(minIntegerDigits: 2), "01")
        XCTAssertEqual(15.l10n(minIntegerDigits: 1), "15")
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
    
    func testNSNumber() {
        XCTAssertEqual((0 as NSNumber).l10n(), "0")
        XCTAssertEqual((0.0 as NSNumber).l10n(), "0")
        XCTAssertEqual((3 as NSNumber).l10n(), "3")
        XCTAssertEqual((4123 as NSNumber).l10n(), "4123")
        XCTAssertEqual((3.14 as NSNumber).l10n(), "3.14")
        XCTAssertEqual((4.651273 as NSNumber).l10n(), "4.651273")
    }
    
    func testNegativeInt() {
        XCTAssertEqual((-1).l10n(), "-1")
        XCTAssertEqual((-15).l10n(), "-15")
        XCTAssertEqual((-7_215_633).l10n(), "-7215633")
        XCTAssertEqual((-1).l10n(minIntegerDigits: 2), "-1")
        XCTAssertEqual((-1).l10n(minIntegerDigits: 3), "-01")
        XCTAssertEqual((-15).l10n(minIntegerDigits: 1), "-15")
    }
    
    func testNegativeDouble() {
        XCTAssertEqual((-3.14).l10n(), "-3.1400")
        XCTAssertEqual((-4.651273).l10n(), "-4.6513")
        XCTAssertEqual((-4.651273).l10n(fractionDigits: 0), "-5")
        XCTAssertEqual((-4.651273).l10n(fractionDigits: 1), "-4.7")
        XCTAssertEqual((-4.651273).l10n(fractionDigits: 2), "-4.65")
        XCTAssertEqual((-4.651273).l10n(fractionDigits: 3), "-4.651")
    }
    
    func testNegativeNSNumber() {
        XCTAssertEqual((-3 as NSNumber).l10n(), "-3")
        XCTAssertEqual((-4_123 as NSNumber).l10n(), "-4123")
        XCTAssertEqual((-3.14 as NSNumber).l10n(), "-3.14")
        XCTAssertEqual((-4.651273 as NSNumber).l10n(), "-4.651273")
    }
}
