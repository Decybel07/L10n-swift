//
//  BaseLogger.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 03/05/2021.
//  Copyright © 2021 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

internal struct BaseLogger: Logger {

    func log(_ message: String) {
        print(message)
    }
}
