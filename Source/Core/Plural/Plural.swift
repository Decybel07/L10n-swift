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

    private static let format = Plural.createFormat()
    
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
    
    private static func createFormat() -> String {
        let table = "Plural"
        let `extension` = "stringsdict"
        #if SWIFT_PACKAGE
        var bundle = Bundle.module
        #else
        var bundle = Bundle(for: L10n.self)
        #endif

        if bundle.url(forResource: table, withExtension: `extension`) == nil {
            self.createFileIfNeeded(table: table, extension: `extension`, bundle: &bundle)
        }
        
        return bundle.localizedString(forKey: "integer", value: "other", table: table)
    }
    
    /**
     This is temporary solution for Swift Package Manager.
     
      - SeeAlso:
      [Issue #21](https://github.com/Decybel07/L10n-swift/issues/21)
     */
    private static func createFileIfNeeded(table: String, `extension`: String, bundle: inout Bundle) {
        let subdirectory = "spmResources"
        if bundle.url(forResource: table, withExtension: `extension`, subdirectory: subdirectory) == nil {
            let baseUrl = bundle.bundleURL.appendingPathComponent(subdirectory)
            let url = baseUrl.appendingPathComponent(table).appendingPathExtension(`extension`)
            let fileContent = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>integer</key>
    <dict>
        <key>NSStringLocalizedFormatKey</key>
        <string>%#@value@</string>
        <key>value</key>
        <dict>
            <key>NSStringFormatSpecTypeKey</key>
            <string>NSStringPluralRuleType</string>
            <key>NSStringFormatValueTypeKey</key>
            <string>ld</string>
            <key>zero</key>
            <string>zero</string>
            <key>one</key>
            <string>one</string>
            <key>two</key>
            <string>two</string>
            <key>few</key>
            <string>few</string>
            <key>many</key>
            <string>many</string>
            <key>other</key>
            <string>other</string>
        </dict>
    </dict>
</dict>
</plist>

"""
            do {
                try FileManager.default.createDirectory(at: baseUrl, withIntermediateDirectories: true)
                try fileContent.write(to: url, atomically: true, encoding: .utf8)
                bundle = Bundle(url: baseUrl) ?? bundle
            } catch {
                L10n.shared.logger?.log("Can't create \(url): \(error.localizedDescription)")
            }
        }
    }
}
