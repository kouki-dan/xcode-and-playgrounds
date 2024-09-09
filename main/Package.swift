// swift-tools-version: 5.9

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "Main",
    platforms: [
        .iOS("17.4")
    ],
    products: [
        .library(
            name: "Main",
            targets: ["Main"]
        ),
    ],
    targets: [
        .target(
            name: "Main",
            path: "./XcodeAndPlaygrounds.swiftpm",
            exclude: [
                "Package.swift",
            ]
        ),
    ]
)
