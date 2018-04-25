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
     Format as a template to which the argument values will be replaced in order:
     1. file name (String)
     2. function name (String)
     3. line number (Int)
     4. message (String)

     For example:
     * `"[%@][%@][%d] %@"` -> `"[L10n.swift][languageChanged(oldValue:)][173] "L10n - List of supported languages does not contain "xyz"."`
     */
    var format: String { get }

    /**
     Log a message.

     - parameter message: The message to log.
     */
    func log(_ message: String)
}

public extension Logger {

    var format: String {
        return "[%@][%@][%d] %@"
    }
}

import Foundation
internal extension Logger {

    func info(_ message: String, fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        let fileName = URL(string: fileName.description)?.pathComponents.last ?? ""
        self.log(String(format: self.format, arguments: [fileName, functionName, lineNumber, message]))
    }
}
