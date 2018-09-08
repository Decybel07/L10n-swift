//
//  Locale+utils.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 07.09.2018.
//  Copyright © 2018 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

internal extension Locale {

    private static let components: [(Locale) -> String?] = [
        { $0.languageCode },
        { $0.scriptCode },
        { $0.regionCode },
        { $0.variantCode },
    ]

    func merging(_ locale: Locale) -> Locale {
        #if swift(>=4.1)
            let identifier = Locale.components.compactMap {
                $0(self) ?? $0(locale)
            }.joined(separator: "-")
        #else
            let identifier = Locale.components.flatMap {
                $0(self) ?? $0(locale)
            }.joined(separator: "-")
        #endif

        return Locale(identifier: identifier)
    }
}
