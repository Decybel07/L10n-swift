//
//  L10nUndefinedLanguageTests.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 29.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import XCTest
@testable import L10n

class L10nUndefinedLanguageTests: XCTestCase {

    var instance: L10n!

    override func setUp() {
        super.setUp()
        self.instance = L10n(bundle: Bundle(for: L10nUndefinedLanguageTests.self), language: "🐒")
    }

    func testDefinedKey() {
        XCTAssertEqual("HelloWorld", self.instance.string(for: "HelloWorld"))
    }

    func testDefinedGroupKeyValue() {
        XCTAssertEqual("language", self.instance.string(for: "language"))
    }

    func testDefinedGroupKey() {
        XCTAssertEqual("language.english", self.instance.string(for: "language.english"))
    }

    func testDefinedPlural() {
        XCTAssertEqual("numberOfApples", self.instance.plural(for: "numberOfApples", 0))
        XCTAssertEqual("numberOfApples", self.instance.plural(for: "numberOfApples", 1))
    }
}
