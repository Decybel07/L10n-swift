//
//  IntExtensionTests.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 29.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import XCTest
@testable import L10n_swift

final class IntExtensionTests: L10nBaseTest {

    func testNumber() {
        self.l10nInstance.language = "ja"

        XCTAssertEqual("0", 0.l10n(self.l10nInstance))
        XCTAssertEqual("7,215,633", 7_215_633.l10n(self.l10nInstance))
        XCTAssertEqual("-7,215,633", (-7_215_633).l10n(self.l10nInstance))
    }

    func testNumberWithLeadingZeros() {
        self.l10nInstance.language = "ja"

        XCTAssertEqual("002", 2.l10n(self.l10nInstance, minIntegerDigits: 3))
    }

    func testNumberWithConfigureFormatter() {
        self.l10nInstance.language = "ja"

        XCTAssertEqual("11🐒23🐒58🐒13🐒21", 1_123_581_321.l10n(self.l10nInstance) {
            $0.groupingSize = 2
            $0.groupingSeparator = "🐒"
        })
    }

    func testArabicNumber() {
        self.l10nInstance.language = "ar"

        XCTAssertEqual("٠", 0.l10n(self.l10nInstance))
        XCTAssertEqual("٧٬٢١٥٬٦٣٣", 7_215_633.l10n(self.l10nInstance))
    }

    func testArabicNumberWithLeadingZeros() {
        self.l10nInstance.language = "ar"

        XCTAssertEqual("٠٠٢", 2.l10n(self.l10nInstance, minIntegerDigits: 3))
    }
}
