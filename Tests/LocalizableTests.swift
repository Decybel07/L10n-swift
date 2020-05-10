//
//  LocalizableTests.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 10/05/2020.
//  Copyright © 2020 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import XCTest
@testable import L10n_swift

class LocalizableTests: L10nBaseTest {

    override class func setUp() {
        super.setUp()
        
        L10n.shared.language = "en"
    }
    
    func testL10nWithDefaultParameters() {
        self.checkStrings([
            (key: "language", expected: "Language"),
            (key: "language.value", expected: "Language"),
            (key: "language.current", expected: "English"),
            (key: "hello.world", expected: "Hello World!"),
            (key: "hello.world.deeper", expected: "hello.world.deeper"),
            (key: "parameters", expected: "parameters"),
            (key: "other", expected: "other"),
        ])
    }
    
    private func checkStrings(_ array: [(key: String, expected: String)]) {
        array.forEach { key, expected in
            XCTAssertEqual(expected, key.l10n())
            XCTAssertEqual(expected, L10n.shared.string(for: key))
        }
    }
}
