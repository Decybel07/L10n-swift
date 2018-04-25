//
//  NotificationName+L10nLanguageChanged.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 13.06.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

public extension Notification.Name {

    /**
     Name for language changed notification

     This notification contains information
     * `"sender"` - Instance that sent the notification
     * `"oldValue"` - old language code
     * `"newValue"` - new language code

     */
    static let L10nLanguageChanged = Notification.Name(rawValue: "L10nLanguageChanged")
}
