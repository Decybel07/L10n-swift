//
//  Resource.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 09.11.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

internal protocol Resource {

    subscript(_: String) -> Resource { get }
    subscript(_: Int?) -> Resource { get }

    var isEmpty: Bool { get }

    func text() -> String?
    func merging(_ other: Resource) -> Resource
}

extension Resource {

    subscript(_: Int?) -> Resource {
        return self
    }
}
