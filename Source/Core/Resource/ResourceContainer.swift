//
//  ResourceContainer.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 24.06.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

internal class ResourceContainer {

    private var resource: Resource = EmptyResource()

    subscript(keyPath: String) -> String? {
        return self.resource[keyPath]
    }

    init(bundle: Bundle?, name: String) {
        self.resource = ([
            StringsdictResourceProvider(),
            StringsResourceProvider(),
            PlistResourceProvider(),
            JsonResourceProvider(),
        ] as [ResourceProvider]).reduce(self.resource) { resource, provider in
            resource.merging(provider.load(name: name, in: bundle))
        }
    }

    func inject(dictionary: [String: Any]) {
        self.resource = self.resource.merging(DictionaryResource(dictionary))
    }
}
