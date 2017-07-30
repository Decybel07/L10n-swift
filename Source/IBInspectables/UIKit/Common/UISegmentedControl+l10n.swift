//
//  UISegmentedControl+l10n.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 30.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import UIKit

public extension UISegmentedControl {

    @IBInspectable
    @available(*, unavailable, message: "This property is reserved for Interface Builder.")
    var l10nUseSegmentTitleAsKey: Bool {
        get { fatalError() }
        set {
            (0 ..< self.numberOfSegments).forEach {
                self.setTitle(L10n.shared.string(for: self.titleForSegment(at: $0) ?? ""), forSegmentAt: $0)
            }
        }
    }
}
