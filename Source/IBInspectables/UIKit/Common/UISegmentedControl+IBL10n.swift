//
//  UISegmentedControl+IBL10n.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 30.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import UIKit

extension UISegmentedControl: IBL10n {

    @IBInspectable
    internal var l10nUseSegmentTitleAsKey: Bool {
        get { self.messageForSetOnlyProperty("l10nUseSegmentTitleAsKey", "UISegmentedControl") }
        set {
            if newValue {
                (0 ..< self.numberOfSegments).forEach {
                    if let title = self.titleForSegment(at: $0) {
                        self.setTitle(L10n.shared.string(for: title), forSegmentAt: $0)
                    }
                }
            }
        }
    }
}
