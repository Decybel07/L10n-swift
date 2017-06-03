//
//  Localizable.swift
//  L10n
//
//  Created by Adrian Bobrowski on 03.06.2017.
//  Copyright © 2017 Coding lifestyle. All rights reserved.
//

public protocol Localizable: CVarArg {

    /**
     Returns a string that represents the localized contents of the instance.
     */
    func l10n() -> String
}
