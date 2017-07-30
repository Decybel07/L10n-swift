//
//  UIButton+l10n.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 30.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import UIKit

public extension UIButton {

    @IBInspectable
    @available(*, unavailable, message: "This property is reserved for Interface Builder.")
    var l10nTitle: String {
        get { fatalError() }
        set { self.setTitle(L10n.shared.string(for: newValue), for: .normal) }
    }

    @IBInspectable
    @available(*, unavailable, message: "This property is reserved for Interface Builder.")
    var l10nHighlightedTitle: String {
        get { fatalError() }
        set { self.setTitle(L10n.shared.string(for: newValue), for: .highlighted) }
    }

    @IBInspectable
    @available(*, unavailable, message: "This property is reserved for Interface Builder.")
    var l10nSelectedTitle: String {
        get { fatalError() }
        set { self.setTitle(L10n.shared.string(for: newValue), for: .selected) }
    }

    @IBInspectable
    @available(*, unavailable, message: "This property is reserved for Interface Builder.")
    var l10nDisabledTitle: String {
        get { fatalError() }
        set { self.setTitle(L10n.shared.string(for: newValue), for: .disabled) }
    }
}
