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
        //.package(url: "https://github.com/danielsaidi/KeyboardKit.git", from: "3.1.0"),
        .package(url: "https://github.com/danielsaidi/KeyboardKit.git", .branch("master")),
        .package(url: "https://github.com/Quick/Quick.git", from: "2.2.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "8.0.0"),
        .package(url: "https://github.com/danielsaidi/Mockery.git", from: "0.6.0")
    ],
    targets: [
        .target(
            name: "KeyboardKitSwiftUI",
            dependencies: ["KeyboardKit"]),
        .testTarget(
            name: "KeyboardKitSwiftUITests",
            dependencies: ["KeyboardKit", "KeyboardKitSwiftUI", "Quick", "Nimble", "Mockery"])
    ]
)
