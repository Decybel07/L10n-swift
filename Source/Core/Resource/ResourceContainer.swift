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
        return self[keyPath][fittingWidth].text()
    }

    subscript(keyPath: String, variants: [[Plural]], fittingWidth: Int?) -> String? {
        let resource = self[keyPath][fittingWidth]

        return resource["format"].text().map {
            self.pluralFormat(resource: resource, format: $0, variants: variants)
        } ?? variants.first { !$0.isEmpty }.flatMap {
            self.text(resource: resource, variants: $0)
        } ?? resource.text()
    }

    private subscript(keyPath: String) -> Resource {
        return keyPath
            .components(separatedBy: ".")
            .reduce(self.resource) { resource, key in resource[key] }
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

    private func text(resource: Resource, variants: [Plural]) -> String? {
        let resource = resource.isEmpty ? resource["value"] : resource
        if resource.isEmpty {
            return nil
        }
        #if swift(>=4.1)
            return variants.lazy
                .compactMap { resource[$0.rawValue].text() }
                .first ?? resource.text()
        #else
            return variants.lazy
                .flatMap { resource[$0.rawValue].text() }
                .first ?? resource.text()
        #endif
    }

    private func pluralFormat(resource: Resource, format: String, variants: [[Plural]], startPosition: Int = 0) -> String {
        return self.matchArgs(in: format, startPosition: startPosition)
            .map { match -> (range: Range<String.Index>, subFormat: String)? in
                guard let key = match.key,
                    case let index = match.position - 1,
                    variants.indices.contains(index),
                    let format = self.text(resource: resource[key], variants: variants[index])
                else {
                    return nil
                }
                return (match.range, self.pluralFormat(resource: resource, format: format, variants: variants, startPosition: index))
            }
            .reversed()
            .reduce(into: format) { result, match in
                guard let match = match else {
                    return
                }
                result.replaceSubrange(match.range, with: match.subFormat)
            }
    }

    private func matchArgs(in format: String, startPosition: Int) -> [(range: Range<String.Index>, key: String?, position: Int)] {
        var position = startPosition

        return (try? NSRegularExpression(pattern: "(%(%|\\s)*)?(%((\\d+)\\$)?(#@(.+?)@|[^%\\s]))", options: []))?
            .matches(in: format, options: [], range: NSRange(location: 0, length: format.count))
            .filter {
                format[self.createRange(match: $0, format: format, at: 3).unsafelyUnwrapped].filter { $0 == "%" }.count % 2 == 1
            }
            .map { match in
                (
                    self.createRange(match: match, format: format, at: 3).unsafelyUnwrapped,
                    self.createRange(match: match, format: format, at: 7).map { format[$0].description },
                    self.createRange(match: match, format: format, at: 5).flatMap { Int(format[$0].description) } ?? {
                        position += 1
                        return position
                    }()
                )
            } ?? []
    }

    private func createRange(match: NSTextCheckingResult, format: String, at idx: Int) -> Range<String.Index>? {
        #if swift(>=4.0)
            return Range(match.range(at: idx), in: format)
        #else
            return Range(match.rangeAt(idx), in: format)
        #endif
    }
}
