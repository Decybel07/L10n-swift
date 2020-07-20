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
            guard var format = dictionary[$0] as? [String: Any] else {
                return
            }
            if let value = format["NSStringLocalizedFormatKey"] as? String {
                format["format"] = value
            } else if let value = format["NSStringVariableWidthRuleType"] as? [String: Any] {
                dictionary[$0] = value
                return
            }
            dictionary[$0] = self.clean(format)
        }

        [
            "NSStringLocalizedFormatKey",
            "NSStringFormatSpecTypeKey",
            "NSStringFormatValueTypeKey",
        ].forEach { dictionary.removeValue(forKey: $0) }

        return dictionary
    }
}
