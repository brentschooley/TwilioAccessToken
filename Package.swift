// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TwilioAccessToken",
    platforms: [
        .macOS(.v10_12), .iOS(.v12)
    ],
    products: [
        .library(
            name: "TwilioAccessToken",
            targets: ["TwilioAccessToken"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/brentschooley/JSONWebToken.swift",
            from: "2.0.4"
        )
    ],
    targets: [
        .target(
            name: "TwilioAccessToken",
            dependencies: [.product(name: "JSONWebToken", package: "JSONWebToken.swift")]),
        .testTarget(
            name: "TwilioAccessTokenTests",
            dependencies: ["TwilioAccessToken"]),
    ]
)
