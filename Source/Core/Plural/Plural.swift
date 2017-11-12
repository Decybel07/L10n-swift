//
//  Plural.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 09.11.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

internal enum Plural: String {
    case zero
    case one
    case two
    case few
    case many
    case other
    case floating
}

extension Plural {

    private static let format = Bundle(for: L10n.self).localizedString(forKey: "integer", value: "other", table: "Plural")

    static func variants(for number: NSNumber, with locale: Locale?) -> [Plural] {
        var variants: [Plural] = []

        if Double(number.int64Value) != number.doubleValue {
            variants.append(.floating)
        }
        let format = String(format: self.format, locale: locale, number.int64Value)
        variants.append(contentsOf: self.variants(base: Plural(rawValue: format), alternative: .other))
        if variants.last != .other {
            variants.append(.other)
        }
        return variants
    }

    private static func variants(base: Plural?, alternative: Plural) -> [Plural] {
        let variant = base ?? alternative
        return variant == alternative ? [alternative] : [variant, alternative]
    }
}
