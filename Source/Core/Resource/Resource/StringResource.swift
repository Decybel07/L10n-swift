//
//  StringResource.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 09.11.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

internal struct StringResource: Resource {

    private let value: String

    subscript(_: String) -> Resource {
        return EmptyResource()
    }

    var isEmpty: Bool {
        return false
    }

    func text() -> String? {
        return self.value
    }

    func merging(_ other: Resource) -> Resource {
        return other is StringResource ? self : other.merging(self)
    }

    init(_ value: String) {
        self.value = value
    }
}
