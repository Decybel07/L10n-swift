//
//  L10n+Equatable.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 25.04.2018.
//  Copyright © 2018 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

extension L10n: Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func ==(lhs: L10n, rhs: L10n) -> Bool {
        return lhs.language == rhs.language
            && lhs.locale == rhs.locale
            && lhs.bundles == rhs.bundles
    }
}
