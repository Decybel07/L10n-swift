//
//  L10n_ArabicLanguage_Tests.swift
//  L10n Tests
//
//  Created by Adrian Bobrowski on 01.06.2017.
//  Copyright © 2017 Coding lifestyle. All rights reserved.
//

import XCTest
@testable import L10n

class L10n_ArabicLanguage_Tests: XCTestCase {
    
    override class func setUp() {
        super.setUp()
        
        L10n.shared.language = "ar"
    }
    
    func testDefinedKey() {
        let key = "HelloWorld"
        
        XCTAssertNotEqual(key.l10n(), key)
        XCTAssertEqual(key.l10n(), "مرحبا العالم!")
    }
    
    func testUndefinedKey() {
        let key = "AnyUndefinedKey"
        
        XCTAssertEqual(key.l10n(), key)
    }
    
    func testDefinedGroupKeyValue() {
        let key = "language"
        
        XCTAssertNotEqual(key.l10n(), key)
        XCTAssertEqual(key.l10n(), "لغة")
    }
    
    func testDefinedGroupKey() {
        let key = "language.arabic"
        
        XCTAssertNotEqual(key.l10n(), key)
        XCTAssertEqual(key.l10n(), "عربى")
    }
    
    func testUndefinedGroupKey() {
        let key = "any.undefined.key"
        
        XCTAssertEqual(key.l10n(), key)
    }
    
    func testInt() {
        XCTAssertEqual(0.l10n(), "٠")
        XCTAssertEqual(1.l10n(), "١")
        XCTAssertEqual(15.l10n(), "١٥")
        XCTAssertEqual(7_215_633.l10n(), "٧٬٢١٥٬٦٣٣")
        
        XCTAssertEqual(0.l10n(minIntegerDigits: 3), "٠٠٠")
        XCTAssertEqual(1.l10n(minIntegerDigits: 2), "٠١")
        XCTAssertEqual(15.l10n(minIntegerDigits: 1), "١٥")
    }
    
    func testDouble() {
        XCTAssertEqual(0.0.l10n(), "٠")
        XCTAssertEqual(0.01.l10n(), "٠٫٠١")
        XCTAssertEqual(3.14.l10n(), "٣٫١٤")
        XCTAssertEqual(4.651273.l10n(), "٤٫٦٥١٢٧٣")
        XCTAssertEqual(4.651273.l10n(fractionDigits: 0), "٥")
        XCTAssertEqual(4.651273.l10n(fractionDigits: 1), "٤٫٧")
        XCTAssertEqual(4.651273.l10n(fractionDigits: 2), "٤٫٦٥")
        XCTAssertEqual(4.651273.l10n(fractionDigits: 3), "٤٫٦٥١")
    }
    
    func testNSNumber() {
        XCTAssertEqual((0 as NSNumber).l10n(), "٠")
        XCTAssertEqual((0.0 as NSNumber).l10n(), "٠")
        XCTAssertEqual((3 as NSNumber).l10n(), "٣")
        XCTAssertEqual((4123 as NSNumber).l10n(), "٤٬١٢٣")
        XCTAssertEqual((3.14 as NSNumber).l10n(), "٣٫١٤")
        XCTAssertEqual((4.651273 as NSNumber).l10n(), "٤٫٦٥١٢٧٣")
    }
    
    func testNegativeInt() {
        XCTAssertEqual((-1).l10n(), "‏-١")
        XCTAssertEqual((-15).l10n(), "‏-١٥")
        XCTAssertEqual((-7_215_633).l10n(), "‏-٧٬٢١٥٬٦٣٣")
        XCTAssertEqual((-1).l10n(minIntegerDigits: 2), "‏-٠١")
        XCTAssertEqual((-15).l10n(minIntegerDigits: 1), "‏-١٥")
    }
    
    func testNegativeDouble() {
        XCTAssertEqual((-3.14).l10n(), "‏-٣٫١٤")
        XCTAssertEqual((-4.651273).l10n(), "‏-٤٫٦٥١٢٧٣")
        XCTAssertEqual((-4.651273).l10n(fractionDigits: 0), "‏-٥")
        XCTAssertEqual((-4.651273).l10n(fractionDigits: 1), "‏-٤٫٧")
        XCTAssertEqual((-4.651273).l10n(fractionDigits: 2), "‏-٤٫٦٥")
        XCTAssertEqual((-4.651273).l10n(fractionDigits: 3), "‏-٤٫٦٥١")
    }
    
    func testNegativeNSNumber() {
        XCTAssertEqual((-3 as NSNumber).l10n(), "‏-٣")
        XCTAssertEqual((-4_123 as NSNumber).l10n(), "‏-٤٬١٢٣")
        XCTAssertEqual((-3.14 as NSNumber).l10n(), "‏-٣٫١٤")
        XCTAssertEqual((-4.651273 as NSNumber).l10n(), "‏-٤٫٦٥١٢٧٣")
    }
}
