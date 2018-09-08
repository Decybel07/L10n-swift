//
//  Locale+utils.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 07.09.2018.
//  Copyright © 2018 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

internal extension Locale {

    func merging(_ locale: Locale) -> Locale {
        return Locale(identifier: ([
            { $0.languageCode },
            { $0.scriptCode },
            { $0.regionCode },
            { $0.variantCode },
        ] as [(Locale) -> String?]).compactMap {
            $0(self) ?? $0(locale)
        }.joined(separator: "-"))
    }
}
