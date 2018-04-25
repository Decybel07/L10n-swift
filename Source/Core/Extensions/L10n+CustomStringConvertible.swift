//
//  L10n+CustomStringConvertible.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 25.04.2018.
//  Copyright © 2018 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

extension L10n: CustomStringConvertible {

    /// A textual representation of this instance.
    public var description: String {
        return "L10n(\(self.language))"
    }
}
