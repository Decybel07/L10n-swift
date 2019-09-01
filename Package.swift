// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
//
//  Package.swift
//  swift-tools-version:5.0
//  Created by Adrian Bobrowski on 30.04.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "L10n-swift",
    platforms: [
        .macOS(.v10_10), .iOS(.v9), .tvOS(.v9), .watchOS(.v2)
    ],
    products: [
        .library(name: "L10n-swift", targets: ["L10n-swift"]),
    ],
    targets: [
        .target(
            name: "L10n-swift",
            path: "Source",
            exclude: {
                var paths: [String] = []
                #if !canImport(WatchKit)
                    paths.append("IBInspectables/WatchKit")
                #endif

                #if canImport(UIKit)
                    #if os(iOS)
                        paths.append("IBInspectables/UIKit/tvOS")
                    #elseif os(tvOS)
                        paths.append("IBInspectables/UIKit/iOS")
                    #endif
                #else
                    paths.append("IBInspectables/UIKit")
                #endif
                return paths
            }()
        ),
//        .testTarget(
//            name: "L10n-swiftTest",
//            dependencies: ["L10n-swift"],
//            path: "Tests",
//            cSettings: [.define("LANG", to: "en_US.UTF-8")]
//        ),
    ],
    swiftLanguageVersions: [.v4, .v4_2, .v5]
)
