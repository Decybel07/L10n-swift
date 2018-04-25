//
//  DoubleExtensionTests.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 29.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import XCTest
@testable import L10n_swift

class DoubleExtensionTests: XCTestCase {

    var instance: L10n!

    override func setUp() {
        super.setUp()
        self.instance = L10n(bundle: Bundle(for: DoubleExtensionTests.self), language: "es")
    }

    func testNumber() {
        XCTAssertEqual("0", 0.0.l10n(self.instance))
        XCTAssertEqual("0,1", 0.1.l10n(self.instance))
        XCTAssertEqual("3,14", 3.14.l10n(self.instance))
        XCTAssertEqual("-4,651", (-4.651).l10n(self.instance))
    }

    func testNumberWithDefinedFractionDigits() {
        XCTAssertEqual("3,1", 3.142.l10n(self.instance, fractionDigits: 1))
        XCTAssertEqual("4,7", 4.651.l10n(self.instance, fractionDigits: 1))
        XCTAssertEqual("3,14000", 3.14.l10n(self.instance, fractionDigits: 5))
    }

    func testNumberWithConfigureFormatter() {
        XCTAssertEqual("3π14", 3.14.l10n(self.instance) {
            $0.decimalSeparator = "π"
        })
    }

    func testArabicNumber() {
        self.instance.language = "ar"

        XCTAssertEqual("٠", 0.0.l10n(self.instance))
        XCTAssertEqual("٠٫١", 0.1.l10n(self.instance))
        XCTAssertEqual("٣٫١٤", 3.14.l10n(self.instance))
    }

    func testArabicNumberWithDefinedFractionDigits() {
        self.instance.language = "ar"

        XCTAssertEqual("٣٫١", 3.142.l10n(self.instance, fractionDigits: 1))
        XCTAssertEqual("٤٫٧", 4.651.l10n(self.instance, fractionDigits: 1))
        XCTAssertEqual("٣٫١٤٠٠٠", 3.14.l10n(self.instance, fractionDigits: 5))
    }
}
