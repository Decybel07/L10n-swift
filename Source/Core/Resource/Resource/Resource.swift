//
//  Resource.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 09.11.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

internal protocol Resource {

    subscript(_: String) -> Resource { get }

    func text() -> String?
    func text(for: Int?) -> String?
    func merging(_ other: Resource) -> Resource
}

extension Resource {

    func text(for _: Int?) -> String? {
        return self.text()
    }
}
