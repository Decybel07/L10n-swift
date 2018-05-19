//
//  L10n+CustomDebugStringConvertible.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 25.04.2018.
//  Copyright © 2018 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

extension L10n: CustomDebugStringConvertible {

    /// A textual representation of this instance, suitable for debugging.
    public var debugDescription: String {
        return "L10n {"
            + "\n\tLanguage: \(self.language)"
            + "\n\tPreferred language: \(self.preferredLanguage)"
            + "\n\tSupported languages: \(self.supportedLanguages)"
            + "\n\tBundles: ["
            + "\(self.bundles.map { "\n\t\t\($0.bundlePath.debugDescription)" }.joined(separator: ","))"
            + "\n\t]"
            + "\n}"
    }
}
