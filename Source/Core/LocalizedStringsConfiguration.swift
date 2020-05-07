//
//  LocalizedStringsConfiguration.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 05/05/2020.
//  Copyright © 2020 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

/// Struct LocalizedStringsConfiguration used to modification of output.
public struct LocalizedStringsConfiguration: TextDecorator {
    
    /// A shared instance of `L10n`.
    public static let shared: LocalizedStringsConfiguration = .init(userDefaults: .standard)
    
    /// A Boolean value indicating whether a text shouldn't be localized. If `true`, the localization key will  be returned as text.
    public var isNonLocalized: Bool
    
    /// A Boolean value indicating whether a text should be doubled.
    public var isDoubleLength: Bool {
        didSet {
            self.update()
        }
    }
    
    /// A Boolean value indicating whether a text should be accented.
    public var isAccented: Bool {
        didSet {
            self.update()
        }
    }
    
    /// A Boolean value indicating whether a text should be bounded.
    public var isBounded: Bool {
        didSet {
            self.update()
        }
    }
    
    /// A Boolean value indicating whether a text should be reversed.
    public var isForcedRightToLeft: Bool {
        didSet {
            self.update()
        }
    }
        
    private var decorators: [TextDecorator] = []
    
    func decorate(text: String) -> String {
        return self.decorators.reduce(into: text) { $0 = $1.decorate(text: $0) }
    }
    
    public init(
        isNonLocalized: Bool = false,
        isDoubleLength: Bool = false,
        isAccented: Bool = false,
        isBounded: Bool = false,
        isForcedRightToLeft: Bool = false
    ) {
        self.isNonLocalized = isNonLocalized
        self.isDoubleLength = isDoubleLength
        self.isAccented = isAccented
        self.isBounded = isBounded
        self.isForcedRightToLeft = isForcedRightToLeft
        self.update()
    }
    
    public init(userDefaults: UserDefaults) {
        self.init(
            isNonLocalized: userDefaults.bool(forKey: "NSShowNonLocalizedStrings"),
            isDoubleLength: userDefaults.bool(forKey: "NSDoubleLocalizedStrings"),
            isAccented: userDefaults.bool(forKey: "NSAccentuateLocalizedStrings"),
            isBounded: userDefaults.bool(forKey: "NSSurroundLocalizedStrings"),
            isForcedRightToLeft: userDefaults.bool(forKey: "NSForceRightToLeftLocalizedStrings")
        )
    }
    
    private mutating func update() {
        var decorators: [TextDecorator] = []
        if self.isForcedRightToLeft {
            decorators.append(RightToLeftTextDecorator())
        }
        if self.isAccented {
            decorators.append(AccentedTextDecorator())
        }
        if self.isDoubleLength {
            decorators.append(DoubleLengthTextDecorator())
        }
        if self.isBounded {
            decorators.append(BoundedTextDecorator())
        }
        self.decorators = decorators
    }
}
