//
//  DictionaryResource.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 09.11.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

internal struct DictionaryResource: Resource {

    private let values: [String: Resource]
    private let fittingWidths: [Int]

    subscript(_ key: String) -> Resource {
        return self.values[key] ?? EmptyResource()
    }

    func text() -> String? {
        return self.values["value"]?.text()
    }

    func text(for fittingWidth: Int?) -> String? {
        if self.fittingWidths.isEmpty {
            return self.text()
        }
        let fittingWidth = fittingWidth ?? Int.max
        var width = self.fittingWidths[0]
        for current in self.fittingWidths.dropFirst() {
            if current > fittingWidth {
                break
            }
            width = current
        }
        return self.values[width.description]?.text()
    }

    func merging(_ other: Resource) -> Resource {
        let otherValues = (other as? DictionaryResource)?.values ?? ["value": other]
        return DictionaryResource(self.values.merging(otherValues) { $0.merging($1) })
    }

    init(_ dictionary: [String: Any]) {
        self.init(dictionary.reduce(into: [String: Resource]()) { result, pair in
            var resource: Resource!

            let keys = pair.key.components(separatedBy: ".")
            if keys.count > 1 {
                resource = DictionaryResource([keys.dropFirst().joined(separator: "."): pair.value])
            } else if let value = pair.value as? [String: Any] {
                resource = DictionaryResource(value)
            } else if let value = pair.value as? String {
                resource = StringResource(value)
            } else {
                return
            }
            result[keys[0]] = (result[keys[0]] ?? EmptyResource()).merging(resource)
        })
    }

    init(_ values: [String: Resource]) {
        self.values = values
        #if swift(>=4.1)
            self.fittingWidths = values.keys.compactMap { Int($0) }.sorted()
        #else
            self.fittingWidths = values.keys.flatMap { Int($0) }.sorted()
        #endif
    }
}
