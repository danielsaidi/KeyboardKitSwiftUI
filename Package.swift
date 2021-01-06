// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "KeyboardKitSwiftUI",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "KeyboardKitSwiftUI",
            targets: ["KeyboardKitSwiftUI"])
    ],
    dependencies: [
        //.package(url: "https://github.com/danielsaidi/KeyboardKit.git", from: "3.3.0"),
        .package(url: "https://github.com/danielsaidi/KeyboardKit.git", .branch("secondary-callout")),
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "3.0.0")),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "9.0.0")),
        .package(url: "https://github.com/danielsaidi/MockingKit.git", .upToNextMajor(from: "0.8.0"))
    ],
    targets: [
        .target(
            name: "KeyboardKitSwiftUI",
            dependencies: ["KeyboardKit"]),
        .testTarget(
            name: "KeyboardKitSwiftUITests",
            dependencies: ["KeyboardKit", "KeyboardKitSwiftUI", "Quick", "Nimble", "MockingKit"])
    ]
)
