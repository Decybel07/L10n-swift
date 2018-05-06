//
//  JsonResourceProvider.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 06.05.2018.
//  Copyright © 2018 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

internal struct JsonResourceProvider: ResourceProvider {

    var type: String {
        return "json"
    }

    func load(file path: String) -> [String: Any] {
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
            let dictionary = json as? [String: Any]
        else {
            return [:]
        }
        return dictionary
    }
}
