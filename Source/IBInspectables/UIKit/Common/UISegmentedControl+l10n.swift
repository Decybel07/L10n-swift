//
//  UISegmentedControl+l10n.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 30.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import UIKit

extension UISegmentedControl: IBL10n {

    @IBInspectable
    var l10nUseSegmentTitleAsKey: Bool {
        get { self.messageForSetOnlyProperty("l10nUseSegmentTitleAsKey", "UISegmentedControl") }
        set {
            (0 ..< self.numberOfSegments).forEach {
                self.setTitle(L10n.shared.string(for: self.titleForSegment(at: $0) ?? ""), forSegmentAt: $0)
            }
        }
    }
}
