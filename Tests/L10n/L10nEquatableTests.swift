//
//  L10nEquatableTests.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 10/05/2020.
//  Copyright © 2020 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import XCTest
@testable import L10n_swift

class L10nEquatableTests: L10nBaseTest {

    func testEqual() {
        let left = self.l10nInstance.unsafelyUnwrapped
        let right = L10n(bundle: self.bundle)
        
        XCTAssertEqual(left, right)
        XCTAssertFalse(left === right)
    }
    
    func testEqualWithDifferentLanguage() {
        let left = self.l10nInstance.unsafelyUnwrapped
        let right = L10n(bundle: self.bundle)
        left.language = "en"
        right.language = "pl"
        
        XCTAssertNotEqual(left, right)
    }
    
    func testEqualWithDifferentBundles() {
        let left = self.l10nInstance.unsafelyUnwrapped
        let right = L10n()
        left.language = "en"
        right.language = "en"
        
        XCTAssertNotEqual(left, right)
    }
    
}
