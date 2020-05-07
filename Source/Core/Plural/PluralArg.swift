//
//  PluralArg.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 09/06/2019.
//  Copyright © 2019 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

/// Protocol PluralArg.
public protocol PluralArg: CVarArg {

    var arg: CVarArg { get }
    var value: NSNumber { get }
    var convertedArg: CVarArg { get }
}

extension PluralArg {

    public var convertedArg: CVarArg {
        return self.arg
    }

    public var _cVarArgEncoding: [Int] {
        return self.arg._cVarArgEncoding
    }
}
