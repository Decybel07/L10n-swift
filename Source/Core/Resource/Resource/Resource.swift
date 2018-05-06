//
//  Resource.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 09.11.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

internal protocol Resource {

    var value: String? { get }

    subscript(_: String) -> Resource { get }
    subscript(_: String) -> String? { get }

    func merging(_ other: Resource) -> Resource
}
