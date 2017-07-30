//
//  NSTextField+l10n.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 30.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Cocoa

public extension NSTextField {

    @IBInspectable
    @available(*, unavailable, message: "This property is reserved for Interface Builder.")
    var l10nStringValue: String {
        get { fatalError() }
        set { self.stringValue = L10n.shared.string(for: newValue) }
    }
}
