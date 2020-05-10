//
//  L10nBaseTest.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 19.05.2018.
//  Copyright © 2018 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import XCTest
@testable import L10n_swift

class L10nBaseTest: XCTestCase {

    private static var oldValue: L10n?
    private static let bundle = Bundle(for: L10nBaseTest.self)
    
    private(set) var l10nInstance: L10n!
    
    var bundle: Bundle {
        return L10nBaseTest.bundle
    }

    override class func setUp() {
        super.setUp()
        
        L10nBaseTest.oldValue = L10n.shared
        L10n.shared = L10n(bundle: Bundle(for: L10nBaseTest.self))
    }
    
    override class func tearDown() {
        super.tearDown()
        
        if let oldValue = L10nBaseTest.oldValue {
            L10n.shared = oldValue
        }
    }
    
    override func setUp() {
        super.setUp()
        self.l10nInstance = L10n(bundle: self.bundle)
    }
}
