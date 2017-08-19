//
//  UIDatePicker+l10n.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 30.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import UIKit

extension UIDatePicker: IBL10n {

    var l10nUseCurrentLocale: Bool {
        get { self.messageForSetOnlyProperty("l10nUseCurrentLocale", "UIDatePicker") }
        set { self.locale = L10n.shared.locale }
    }
}
