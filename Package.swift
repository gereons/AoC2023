// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "AdventOfCode",
    platforms: [ .macOS(.v15) ],
    dependencies: [
        .package(url: "https://github.com/gereons/AoCTools", from: "0.1.6"),
        // .package(path: "../AoCTools"),
    ],
    targets: [
        .executableTarget(name: "AdventOfCode", dependencies: [ "AoCTools" ], path: "Sources"),
        .testTarget(name: "AoCTests", dependencies: [ "AdventOfCode", "AoCTools" ], path: "Tests")
    ]
)
