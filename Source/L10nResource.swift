//
//  L10nResource.swift
//  L10n
//
//  Created by Adrian Bobrowski on 24.06.2017.
//  Copyright © 2017 Coding lifestyle. All rights reserved.
//

import Foundation

internal class L10nResource {

    private let name: String
    private var bundle: Bundle?
    private var stringsdict: NSDictionary?
    private var plist: NSDictionary?

    init(language: String, name: String) {
        self.name = name
        self.bundle = self.createBundle(language: language)
        self.plist = self.createDictionary(type: "plist")
        self.stringsdict = self.createDictionary(type: "stringsdict")
    }

    final func string(for key: String) -> String? {
        return self.stringFromDictionary(self.stringsdict, for: key)
            ?? self.stringFromDictionary(self.plist, for: key)
            ?? self.stringFromBundle(for: key)
    }

    private func createBundle(language: String) -> Bundle? {
        guard let path = Bundle.main.path(forResource: language, ofType: "lproj") else {
            return nil
        }
        return Bundle(path: path)
    }

    private func createDictionary(type: String) -> NSDictionary? {
        guard let path = self.bundle?.path(forResource: self.name, ofType: type) else {
            return nil
        }
        return NSDictionary(contentsOfFile: path)
    }

    private func stringFromBundle(for key: String) -> String? {
        guard let text = self.bundle?.localizedString(forKey: key, value: nil, table: self.name), !text.isEmpty else {
            return nil
        }
        return text
    }

    private func stringFromDictionary(_ dictionary: NSDictionary?, for key: String) -> String? {
        if var node = dictionary?.value(forKeyPath: key) {
            if let value = (node as? NSDictionary)?.value(forKey: "value") {
                node = value
            }
            if let text = node as? String {
                return text
            }
        }
        return nil
    }
}
