//
//  DictionaryResource.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 09.11.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

internal struct DictionaryResource: Resource {

    let values: [String: Resource]

    var value: String? {
        return self.values["value"]?.value
    }

    subscript(key: String) -> Resource {
        return self.values[key] ?? EmptyResource()
    }

    subscript(keyPath: String) -> String? {
        return (keyPath.components(separatedBy: ".").reduce(self) { resource, key in
            resource[key]
        } as Resource).value
    }

    func merging(_ other: Resource) -> Resource {
        let otherValues = (other as? DictionaryResource)?.values ?? ["value": other]
        return DictionaryResource(values: self.values.merging(otherValues) { $0.merging($1) })
    }
}

internal extension DictionaryResource {

    init(_ dictionary: [String: Any]) {
        self.values = dictionary.reduce(into: [String: Resource]()) { result, pair in
            var resource: Resource!

            let keys = pair.key.components(separatedBy: ".")
            if keys.count > 1 {
                resource = DictionaryResource([keys.dropFirst().joined(separator: "."): pair.value])
            } else if let value = pair.value as? [String: Any] {
                resource = DictionaryResource(value)
            } else if let value = pair.value as? String {
                resource = StringResource(value: value)
            } else {
                return
            }
            result[keys[0]] = (result[keys[0]] ?? EmptyResource()).merging(resource)
        }
    }
}
