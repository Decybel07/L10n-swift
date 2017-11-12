//
//  Logger.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 29.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

/// Protocol Localizable.
public protocol Logger {

    /**
     Log a message.

     - parameter message: The message to log.
     */
    func log(_ message: String)
}

import Foundation
internal extension Logger {

    func info(_ message: String, fileName: StaticString = #file, functionName: StaticString = #function, lineNumber: Int = #line) {
        let fileName = URL(string: fileName.description)?.pathComponents.last ?? ""
        self.log("[\(fileName)][\(functionName)][\(lineNumber)] \(message)")
    }
}
