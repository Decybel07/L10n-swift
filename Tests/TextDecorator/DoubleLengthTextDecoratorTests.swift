//
//  DoubleLengthTextDecoratorTests.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 10/05/2020.
//  Copyright © 2020 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import XCTest
@testable import L10n_swift

class DoubleLengthTextDecoratorTests: XCTestCase {

    func testDecorate() throws {
        let decorator = DoubleLengthTextDecorator()
        
        XCTAssertEqual("Some text Some text", decorator.decorate(text: "Some text"))
        XCTAssertEqual("Double length Double length", decorator.decorate(text: "Double length"))
    }
}
