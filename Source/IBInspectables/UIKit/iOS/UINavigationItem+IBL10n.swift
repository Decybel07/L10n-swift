//
//  UINavigationItem+IBL10n.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 30.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import UIKit

extension UINavigationItem: IBL10n {

    @IBInspectable
    public var l10nTitle: String {
        get { self.messageForSetOnlyProperty() }
        set { self.title = L10n.shared.string(for: newValue) }
    }

    @IBInspectable
    public var l10nPrompt: String {
        get { self.messageForSetOnlyProperty() }
        set { self.prompt = L10n.shared.string(for: newValue) }
    }

    @IBInspectable
    public var l10nBackButton: String {
        get { self.messageForSetOnlyProperty() }
        set {
            if self.backBarButtonItem == nil {
                self.backBarButtonItem = UIBarButtonItem()
            }
            self.backBarButtonItem?.title = L10n.shared.string(for: newValue)
        }
    }
}
