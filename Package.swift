// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdventOfCode",
    platforms: [
        .macOS(.v13)
    ],
    dependencies: [
        .package(url: "https://github.com/gereons/AoCTools", from: "0.0.39")
    ],
    targets: [
        .executableTarget(
            name: "AdventOfCode",
            dependencies: [
                "AoCTools"
            ],
            path: "Sources"),
        .testTarget(
            name: "AoCTests",
            dependencies: [ "AdventOfCode", "AoCTools" ],
            path: "Tests")
    ]
)
