//
//  UISearchBar+IBL10n.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 30.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import UIKit

extension UISearchBar: IBL10n {

    @IBInspectable
    public var l10nText: String {
        get { self.messageForSetOnlyProperty("l10nText", "UISearchBar") }
        set { self.text = L10n.shared.string(for: newValue) }
    }

    @IBInspectable
    public var l10nPrompt: String {
        get { self.messageForSetOnlyProperty("l10nPrompt", "UISearchBar") }
        set { self.prompt = L10n.shared.string(for: newValue) }
    }

    @IBInspectable
    public var l10nPlaceholder: String {
        get { self.messageForSetOnlyProperty("l10nPlaceholder", "UISearchBar") }
        set { self.placeholder = L10n.shared.string(for: newValue) }
    }
}
