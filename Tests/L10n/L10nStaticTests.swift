//
//  L10nStaticTests.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 10/05/2020.
//  Copyright © 2020 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import XCTest
@testable import L10n_swift

class L10nStaticTests: L10nBaseTest {

    override class func setUp() {
        super.setUp()
        
        L10n.shared.language = "pl"
    }
    
    func testSupportedLanguages() {
        XCTAssertEqual(L10n.supportedLanguages, Bundle.main.supportedLanguages)
    }
    
    func testGetPreferredLanguage() {
        XCTAssertEqual(L10n.preferredLanguage, Bundle.main.preferredLanguage)
    }
    
    func testSetPreferredLanguage() {
        let language = "en"
        
        L10n.preferredLanguage = language

        XCTAssertEqual(language, L10n.preferredLanguage)
        XCTAssertEqual(language, UserDefaults.standard.array(forKey: "AppleLanguages")?.first as? String)
    }
    
    func testSetUnsupportedPreferredLanguage() {
        let language = "es"
        
        L10n.preferredLanguage = language
        
        XCTAssertFalse(L10n.supportedLanguages.contains(language))
        XCTAssertNotEqual(language, L10n.preferredLanguage)
        XCTAssertNotEqual(language, UserDefaults.standard.array(forKey: "AppleLanguages")?.first as? String)
    }
    
    func testSetSharedPreferredLanguage() {
        let language = "en"
        L10n.shared.language = language
        
        XCTAssertEqual(language, L10n.preferredLanguage)
        XCTAssertEqual(language, UserDefaults.standard.array(forKey: "AppleLanguages")?.first as? String)
    }
    
    func testLocalizable() {
        L10n.shared.language = "en"
        
        self.l10nInstance.language = "pl"
        XCTAssertEqual("Polish", self.l10nInstance.l10n())
        XCTAssertEqual("angielski", L10n.shared.l10n(self.l10nInstance))
    }
}
