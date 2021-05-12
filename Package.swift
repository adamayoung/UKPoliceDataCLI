// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UKPoliceDataCLI",

    platforms: [
        .macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6)
    ],

    products: [
        .executable(name: "policedata", targets: ["UKPoliceDataCLI"])
    ],

    dependencies: [
        .package(url: "https://github.com/adamayoung/UKPoliceData.git", .branch("main")),
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "0.4.3"),
        .package(url: "https://github.com/scottrhoyt/SwiftyTextTable.git", from: "0.5.0")
    ],
    targets: [
        .target(
            name: "UKPoliceDataCLI",
            dependencies: [
                "UKPoliceData",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "SwiftyTextTable"
            ]
        )
    ]
)
