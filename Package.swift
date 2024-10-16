// swift-tools-version:5.5.0
import PackageDescription

let package = Package(
    name: "SwiftOGG",
    platforms: [
        .iOS(.v10), .macOS(.v10_15), .watchOS(.v6)
    ],
    products: [
        .library(name: "SwiftOGG", targets: ["SwiftOGG"]),
    ],
    dependencies: [
        .package(url: "https://github.com/alta/swift-opus", from: "0.0.2"),
    ],
    targets: [
        .target(
            name: "SwiftOGG",
            dependencies: [
                .product(name: "Opus", package: "swift-opus"),
                "COgg",
                "Copustools"
            ],
            path: "Sources/SwiftOgg"
        ),
        .target(name: "Copustools", path: "Sources/SupportingFiles/Dependencies/Copustools"),
        .target(name: "COgg", dependencies: [], path: "Sources/ogg-1.3.5", publicHeadersPath: "include"),
        .testTarget(name: "EncoderDecoderTests", dependencies: ["SwiftOGG"], resources: [.process("Resources")]),
    ]
)
