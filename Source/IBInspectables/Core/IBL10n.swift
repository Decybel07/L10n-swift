//
//  IBL10n.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 19.08.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

public protocol IBL10n {}

public extension IBL10n {

    func messageForSetOnlyProperty(_ property: String, _ typeName: String) -> Never {
        fatalError("The \(property) property for \(typeName) is reserved for the interface. It's only for setting")
    }
}
