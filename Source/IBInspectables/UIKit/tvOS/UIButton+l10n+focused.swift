//
//  UIButton+l10n+focused.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 30.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import UIKit

public extension UIButton {

    @IBInspectable
    var l10nFocusedTitle: String {
        get { self.messageForSetOnlyProperty("l10nFocusedTitle", "UIButton") }
        set { self.setTitle(L10n.shared.string(for: newValue), for: .focused) }
    }
}
