//
//  NumberExtensionTests.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 10/05/2020.
//  Copyright © 2020 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import XCTest
@testable import L10n_swift

final class NumberExtensionTests: L10nBaseTest {

    func testNumber() {
        self.l10nInstance.language = "es"

        XCTAssertEqual("0", NSNumber(0.0).asNSNumber().l10n(self.l10nInstance))
        XCTAssertEqual("0.1", NSNumber(0.1).l10n(self.l10nInstance))
        XCTAssertEqual("3.14", NSNumber(3.14).l10n(self.l10nInstance))
        XCTAssertEqual("-4.651", NSNumber(-4.651).l10n(self.l10nInstance))
    }
}
