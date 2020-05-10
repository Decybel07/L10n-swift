//
//  BoundedTextDecoratorTests.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 10/05/2020.
//  Copyright © 2020 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import XCTest
@testable import L10n_swift

class BoundedTextDecoratorTests: XCTestCase {

    func testDecorate() throws {
        let decorator = BoundedTextDecorator()
        
        XCTAssertEqual("[# Some text #]", decorator.decorate(text: "Some text"))
        XCTAssertEqual("[# Bounded #]", decorator.decorate(text: "Bounded"))
    }
}
