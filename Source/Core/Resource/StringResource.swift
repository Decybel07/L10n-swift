//
//  StringResource.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 09.11.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

internal struct StringResource: Resource {

    let value: String?

    subscript(_: String) -> Resource {
        return EmptyResource()
    }

    subscript(keyPath: String) -> String? {
        return keyPath.isEmpty ? nil : self.value
    }

    func merging(_ other: Resource) -> Resource {
        if other is StringResource {
            return self
        }
        return other.merging(self)
    }
}
