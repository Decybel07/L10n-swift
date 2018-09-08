//
//  DoubleExtensionTests.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 29.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import XCTest
@testable import L10n_swift

final class DoubleExtensionTests: L10nBaseTest {

    func testNumber() {
        self.l10nInstance.language = "es"

        XCTAssertEqual("0", 0.0.l10n(self.l10nInstance))
        XCTAssertEqual("0.1", 0.1.l10n(self.l10nInstance))
        XCTAssertEqual("3.14", 3.14.l10n(self.l10nInstance))
        XCTAssertEqual("-4.651", (-4.651).l10n(self.l10nInstance))
    }

    func testNumberWithRegionCode() {
        self.l10nInstance.language = "es-PL"

        XCTAssertEqual("0", 0.0.l10n(self.l10nInstance))
        XCTAssertEqual("0,1", 0.1.l10n(self.l10nInstance))
        XCTAssertEqual("3,14", 3.14.l10n(self.l10nInstance))
        XCTAssertEqual("-4,651", (-4.651).l10n(self.l10nInstance))
    }

    func testNumberWithDefinedFractionDigits() {
        self.l10nInstance.language = "es"

        XCTAssertEqual("3.1", 3.142.l10n(self.l10nInstance, fractionDigits: 1))
        XCTAssertEqual("4.7", 4.651.l10n(self.l10nInstance, fractionDigits: 1))
        XCTAssertEqual("3.14000", 3.14.l10n(self.l10nInstance, fractionDigits: 5))
    }

    func testNumberWithConfigureFormatter() {
        self.l10nInstance.language = "es"

        XCTAssertEqual("3π14", 3.14.l10n(self.l10nInstance) {
            $0.decimalSeparator = "π"
        })
    }

    func testArabicNumber() {
        self.l10nInstance.language = "ar"

        XCTAssertEqual("٠", 0.0.l10n(self.l10nInstance))
        XCTAssertEqual("٠٫١", 0.1.l10n(self.l10nInstance))
        XCTAssertEqual("٣٫١٤", 3.14.l10n(self.l10nInstance))
    }

    func testArabicNumberWithDefinedFractionDigits() {
        self.l10nInstance.language = "ar"

        XCTAssertEqual("٣٫١", 3.142.l10n(self.l10nInstance, fractionDigits: 1))
        XCTAssertEqual("٤٫٧", 4.651.l10n(self.l10nInstance, fractionDigits: 1))
        XCTAssertEqual("٣٫١٤٠٠٠", 3.14.l10n(self.l10nInstance, fractionDigits: 5))
    }
}
