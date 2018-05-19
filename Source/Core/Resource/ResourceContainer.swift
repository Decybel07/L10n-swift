//
//  ResourceContainer.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 24.06.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

internal class ResourceContainer {

    private var resource: Resource

    subscript(keyPath: String) -> String? {
        return self.resource[keyPath]
    }

    init(bundles: [Bundle], name: String) {
        let providers: [ResourceProvider] = [
            StringsdictResourceProvider(),
            StringsResourceProvider(),
            PlistResourceProvider(),
            JsonResourceProvider(),
        ]

        self.resource = bundles.reduce(EmptyResource()) { result, bundle in
            providers.reduce(result) { resource, provider in
                resource.merging(provider.load(name: name, in: bundle))
            }
        }
    }

    func inject(dictionary: [String: Any]) {
        self.resource = DictionaryResource(dictionary).merging(self.resource)
    }
}
