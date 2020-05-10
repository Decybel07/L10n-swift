//
//  RightToLeftTextDecoratorTests.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 10/05/2020.
//  Copyright © 2020 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import XCTest
@testable import L10n_swift

class RightToLeftTextDecoratorTests: XCTestCase {

    func testDecorate() throws {
        let decorator = RightToLeftTextDecorator()
        
        XCTAssertEqual("txet emoS", decorator.decorate(text: "Some text"))
        XCTAssertEqual("tfel ot thgiR", decorator.decorate(text: "Right to left"))
    }
}
