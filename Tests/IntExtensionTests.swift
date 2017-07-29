//
//  IntExtensionTests.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 29.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import XCTest
@testable import L10n

class IntExtensionTests: XCTestCase {

    var instance: L10n!

    override func setUp() {
        super.setUp()
        self.instance = L10n(bundle: Bundle(for: IntExtensionTests.self), language: "ja")
    }

    func testNumber() {
        XCTAssertEqual("0", 0.l10n(self.instance))
        XCTAssertEqual("7,215,633", 7_215_633.l10n(self.instance))
        XCTAssertEqual("-7,215,633", (-7_215_633).l10n(self.instance))
    }

    func testNumberWithLeadingZeros() {
        XCTAssertEqual("00002", 2.l10n(self.instance, minIntegerDigits: 5))
    }

    func testNumberWithConfigureFormatter() {
        XCTAssertEqual("11🐒23🐒58🐒13🐒21", 1_123_581_321.l10n(self.instance) {
            $0.groupingSize = 2
            $0.groupingSeparator = "🐒"
        })
    }

    func testArabicNumber() {
        self.instance.language = "ar"

        XCTAssertEqual("٠", 0.l10n(self.instance))
        XCTAssertEqual("٧٬٢١٥٬٦٣٣", 7_215_633.l10n(self.instance))
        XCTAssertEqual("‏-٧٬٢١٥٬٦٣٣", (-7_215_633).l10n(self.instance))
    }

    func testArabicNumberWithLeadingZeros() {
        self.instance.language = "ar"

        XCTAssertEqual("٠٠٠٠٢", 2.l10n(self.instance, minIntegerDigits: 5))
    }
}
