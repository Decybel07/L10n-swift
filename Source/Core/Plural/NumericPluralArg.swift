//
//  NumericPluralArg.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 09/06/2019.
//  Copyright © 2019 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

public struct NumericPluralArg<Number: Numeric & CVarArg>: PluralArg {

    public let value: NSNumber

    public var arg: CVarArg {
        return self.numberArg
    }

    public var convertedArg: CVarArg {
        return self.converting(self.numberArg)
    }

    private let numberArg: Number
    private let converting: (_ arg: Number) -> CVarArg

    public init?(arg: Number, converting: @escaping (_ arg: Number) -> CVarArg = { $0 }) {
        guard let value = arg as? NSNumber else {
            return nil
        }
        self.value = value
        self.numberArg = arg
        self.converting = converting
    }
}
