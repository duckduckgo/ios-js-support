// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FindInPageIOSJSSupport",
    products: [
        .library(
            name: "FindInPageIOSJSSupport",
            targets: ["FindInPageIOSJSSupport"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "FindInPageIOSJSSupport",
            resources: [
                .process("jsSources")
            ]
        ),
    ]
)
