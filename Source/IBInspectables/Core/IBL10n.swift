//
//  IBL10n.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 19.08.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

/// Protocol Localizable.
public protocol IBL10n {}

extension IBL10n {

    /**
     Throw message for set only property.

     - parameter property: The property name.
     - parameter typeName: The type name.

     - throws: `fatalError` with message.
     */
    public func messageForSetOnlyProperty(_ property: String, _ typeName: String) -> Never {
        fatalError(
            "The \(property) property for \(typeName) is reserved for the interface builder. It's only for setting"
        )
    }
}
