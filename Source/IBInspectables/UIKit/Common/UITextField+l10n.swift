//
//  UITextField+l10n.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 30.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import UIKit

public extension UITextField {

    @IBInspectable
    @available(*, unavailable, message: "This property is reserved for Interface Builder.")
    var l10nText: String {
        get { fatalError() }
        set { self.text = L10n.shared.string(for: newValue) }
    }

    @IBInspectable
    @available(*, unavailable, message: "This property is reserved for Interface Builder.")
    var l10nPlaceholder: String {
        get { fatalError() }
        set { self.placeholder = L10n.shared.string(for: newValue) }
    }
}
