//
//  WKInterfaceButton+l10n.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 30.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import WatchKit

public extension WKInterfaceButton {

    @IBInspectable
    @available(*, unavailable, message: "This property is reserved for Interface Builder.")
    var l10nTitle: String {
        get { fatalError() }
        set { self.setTitle(L10n.shared.string(for: newValue)) }
    }
}
