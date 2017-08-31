//
//  UITextField+l10n.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 30.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import UIKit

extension UITextField: IBL10n {

    @IBInspectable
    var l10nText: String {
        get { self.messageForSetOnlyProperty("l10nText", "UITextField") }
        set { self.text = L10n.shared.string(for: newValue) }
    }

    @IBInspectable
    var l10nPlaceholder: String {
        get { self.messageForSetOnlyProperty("l10nPlaceholder", "UITextField") }
        set { self.placeholder = L10n.shared.string(for: newValue) }
    }
}
