//
//  UIButton+IBL10n+focused.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 30.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

#if canImport(UIKit) && os(tvOS)
import UIKit

extension UIButton {

    @IBInspectable
    public var l10nFocusedTitle: String {
        get { self.messageForSetOnlyProperty() }
        set { self.setTitle(L10n.shared.string(for: newValue), for: .focused) }
    }
}

#endif
