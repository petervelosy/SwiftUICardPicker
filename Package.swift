// swift-tools-version: 6.0

import PackageDescription

// TODO: Check OS versions
let package = Package(
    name: "SwiftUICardPicker",
    platforms: [.iOS(.v18), .macOS(.v15), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(
            name: "SwiftUICardPicker",
            targets: ["SwiftUICardPicker"]),
    ],
    targets: [
        .target(
            name: "SwiftUICardPicker"),
        .testTarget(
            name: "SwiftUICardPickerTests",
            dependencies: ["SwiftUICardPicker"]
        ),
    ]
)
