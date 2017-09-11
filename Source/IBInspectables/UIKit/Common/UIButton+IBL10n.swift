//
//  UIButton+IBL10n.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 30.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import UIKit

extension UIButton: IBL10n {

    @IBInspectable
    public var l10nTitle: String {
        get { self.messageForSetOnlyProperty("l10nTitle", "UIButton") }
        set { self.setTitle(L10n.shared.string(for: newValue), for: .normal) }
    }

    @IBInspectable
    public var l10nHighlightedTitle: String {
        get { self.messageForSetOnlyProperty("l10nHighlightedTitle", "UIButton") }
        set { self.setTitle(L10n.shared.string(for: newValue), for: .highlighted) }
    }

    @IBInspectable
    public var l10nSelectedTitle: String {
        get { self.messageForSetOnlyProperty("l10nSelectedTitle", "UIButton") }
        set { self.setTitle(L10n.shared.string(for: newValue), for: .selected) }
    }

    @IBInspectable
    public var l10nDisabledTitle: String {
        get { self.messageForSetOnlyProperty("l10nDisabledTitle", "UIButton") }
        set { self.setTitle(L10n.shared.string(for: newValue), for: .disabled) }
    }
}
