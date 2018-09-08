//
//  StringsdictResourceProvider.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 06.05.2018.
//  Copyright © 2018 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

internal struct StringsdictResourceProvider: ResourceProvider {

    var type: String {
        return "stringsdict"
    }

    func load(file path: String) -> [String: Any] {
        return self.clean(NSDictionary(contentsOfFile: path) as? [String: Any] ?? [:])
    }

    private func clean(_ dictionary: [String: Any]) -> [String: Any] {
        var dictionary = dictionary
        dictionary.keys.forEach {
            guard let format = dictionary[$0] as? [String: Any] else {
                return
            }
            if let key = self.formatKey(for: format), var value = format[key] as? [String: Any] {
                value.removeValue(forKey: "NSStringFormatSpecTypeKey")
                value.removeValue(forKey: "NSStringFormatValueTypeKey")
                dictionary[$0] = value
            } else if let value = format["NSStringVariableWidthRuleType"] as? [String: Any] {
                dictionary[$0] = value
            } else {
                dictionary[$0] = self.clean(format)
            }
        }
        return dictionary
    }

    private func formatKey(for dictionary: [String: Any]) -> String? {
        guard let format = dictionary["NSStringLocalizedFormatKey"] as? String,
            let range = self.matchRange(in: format)
        else {
            return nil
        }
        return format[range].description
    }

    private func matchRange(in format: String) -> Range<String.Index>? {
        guard let regularExpression = try? NSRegularExpression(pattern: "@(.+?)@", options: []),
            let match = regularExpression.matches(
                in: format, options: [], range: NSRange(location: 0, length: format.count)
            ).first
        else {
            return nil
        }

        #if swift(>=4.0)
            return Range(match.range(at: 1), in: format)
        #else
            return Range(match.rangeAt(1), in: format)
        #endif
    }
}
