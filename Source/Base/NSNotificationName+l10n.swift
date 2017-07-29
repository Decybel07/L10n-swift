//
//  NSNotificationName+l10n.swift
//  L10n
//
//  Created by Adrian Bobrowski on 13.06.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

public extension NSNotification.Name {

    /**
     Name for language changed notification

     This notification contains information
     * **oldValue** - old language code
     * **newValue** - new language code

     */
    static let L10nLanguageChanged = NSNotification.Name(rawValue: "L10nLanguageChanged")
}
