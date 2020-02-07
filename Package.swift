// swift-tools-version:5.3
//
//  Package.swift
//  Created by Adrian Bobrowski on 30.04.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "L10n-swift",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v10_10), .iOS(.v9), .tvOS(.v9), .watchOS(.v2)
    ],
    products: [
        .library(name: "L10n-swift", targets: ["L10n-swift"]),
    ],
    targets: [
        .target(
            name: "L10n-swift",
            path: "Source"
        ),
    ],
    swiftLanguageVersions: [.v4, .v4_2, .v5]
)
