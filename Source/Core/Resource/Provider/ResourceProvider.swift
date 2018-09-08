//
//  ResourceProvider.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 06.05.2018.
//  Copyright © 2018 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

internal protocol ResourceProvider {

    var type: String { get }

    func load(file path: String) -> [String: Any]
}

internal extension ResourceProvider {

    func load(name: String, in bundle: Bundle?) -> Resource {
        guard let path = bundle?.path(forResource: name, ofType: self.type),
            case let dictionary = self.load(file: path),
            !dictionary.isEmpty
        else {
            return EmptyResource()
        }
        return DictionaryResource(dictionary)
    }

    func load(file path: String) -> [String: Any] {
        return NSDictionary(contentsOfFile: path) as? [String: Any] ?? [:]
    }
}
