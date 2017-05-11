//
//  L10n_ChangeLanguage_Test.swift
//  L10n Tests
//
//  Created by Adrian Bobrowski on 10.05.2017.
//  Copyright © 2017 Coding lifestyle. All rights reserved.
//

import XCTest
@testable import L10n

class L10n_ChangeLanguage_Test: XCTestCase {

    private let defaultLanguage = "en"

    override func setUp() {
        super.setUp()

        L10n.shared.language = defaultLanguage
    }

    func testChangeToTheSameLanguage() {

        L10n.shared.language = defaultLanguage

        XCTAssertEqual(L10n.shared.language, defaultLanguage)
    }

    func testChangeToUnsupportedLanguage() {

        let newLanguage = "Any unsupported language"

        L10n.shared.language = newLanguage

        XCTAssertNotEqual(L10n.shared.language, self.defaultLanguage)
        XCTAssertEqual(L10n.shared.language, newLanguage)
        XCTAssertNil(L10n.shared.locale)
    }

    func testChangeToOtherSupportedLanguage() {

        let newLanguage = "pl"

        L10n.shared.language = newLanguage

        XCTAssertNotEqual(L10n.shared.language, self.defaultLanguage)
        XCTAssertEqual(L10n.shared.language, newLanguage)
        XCTAssertNotNil(L10n.shared.locale)
    }
}
