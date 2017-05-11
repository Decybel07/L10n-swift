//
//  L10n_Static_Tests.swift
//  L10n Tests
//
//  Created by Adrian Bobrowski on 10.05.2017.
//  Copyright © 2017 Coding lifestyle. All rights reserved.
//

import XCTest
@testable import L10n

class L10n_Static_Tests: XCTestCase {

    override class func setUp() {
        super.setUp()

        let language = Bundle.main.preferredLocalizations.first ?? "UNDEFINED"

        XCTAssertEqual(L10n.shared.language, language)
    }

    func testGetPreferredLanguage() {
        let language = Bundle.main.preferredLocalizations.first ?? "UNDEFINED"

        XCTAssertEqual(L10n.preferredLanguage, language)
    }

    func testGetPreferredLanguages() {
        let languages = Bundle.main.preferredLocalizations

        XCTAssertEqual(L10n.preferredLanguages, languages)
    }

    func testGetSupportedLanguages() {
        let languages = Bundle.main.localizations

        XCTAssertEqual(L10n.supportedLanguages, languages)
    }
}
