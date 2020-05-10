//
//  AccentedTextDecoratorTests.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 10/05/2020.
//  Copyright © 2020 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import XCTest
@testable import L10n_swift

class AccentedTextDecoratorTests: XCTestCase {

    func testDecorate() throws {
        let decorator = AccentedTextDecorator()
        
        XCTAssertEqual("S̱̓ó̱m̯͊ȅ̤ ṫ̥ȅ̤x̬̌ṫ̥", decorator.decorate(text: "Some text"))
        XCTAssertEqual("A̭͊c̗̍c̗̍ȅ̤ǹ̰ṫ̥ȅ̤d̜̎", decorator.decorate(text: "Accented"))
    }
}
