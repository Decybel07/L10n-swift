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

    subscript(keyPath: String, fittingWidth: Int?) -> String? {
        return self[keyPath].text(for: fittingWidth)
    }

    subscript(keyPath: String, variants: [Plural], fittingWidth: Int?) -> String? {
        let resource = self[keyPath]

        #if swift(>=4.1)
            let variants = variants.lazy.compactMap { plural in
                resource[plural.rawValue].text(for: fittingWidth)
            }
        #else
            let variants = variants.lazy.flatMap { plural in
                resource[plural.rawValue].text(for: fittingWidth)
            }
        #endif

        return variants.first ?? resource.text(for: fittingWidth)
    }

    private subscript(keyPath: String) -> Resource {
        return keyPath.components(separatedBy: ".").reduce(self.resource) { resource, key in
            resource[key]
        } as Resource
    }

    func inject(dictionary: [String: Any]) {
        self.resource = DictionaryResource(dictionary).merging(self.resource)
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
}
