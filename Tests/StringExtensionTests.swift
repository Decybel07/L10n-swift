//
//  StringExtensionTests.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 29.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import XCTest
@testable import L10n_swift

class StringExtensionTests: XCTestCase {

    var instance: L10n!

    override func setUp() {
        super.setUp()
        self.instance = L10n(bundle: Bundle(for: StringExtensionTests.self), language: "pl")
    }

    func testDafaultResourceWithDefinedKey() {
        XCTAssertEqual("HelloWorld".l10n(self.instance), "Witaj świecie!")
    }

    func testDafaultResourceWithUndefinedKey() {
        XCTAssertEqual("SampleUndefinedKey".l10n(self.instance), "SampleUndefinedKey")
    }

    func testUndefinedResource() {
        XCTAssertEqual("SomeKey".l10n(self.instance, resource: "SomeUndefinedResource"), "SomeKey")
    }

    func testStringWithArgs() {
        XCTAssertEqual("numberOfApples".l10n(self.instance, args: 2), "2 jabłka")
    }

    func testStringWithArgsAsArray() {
        XCTAssertEqual("numberOfApples".l10n(self.instance, args: [5]), "5 jabłek")
    }
}
