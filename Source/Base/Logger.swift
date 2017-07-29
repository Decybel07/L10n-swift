//
//  Logger.swift
//  L10n
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
