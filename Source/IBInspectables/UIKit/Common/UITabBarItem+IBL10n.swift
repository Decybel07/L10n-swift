//
//  UITabBarItem+IBL10n.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 30.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import UIKit

extension UITabBarItem {

    @IBInspectable
    public var l10nBadge: String {
        get { self.messageForSetOnlyProperty() }
        set { self.badgeValue = L10n.shared.string(for: newValue) }
    }
}
