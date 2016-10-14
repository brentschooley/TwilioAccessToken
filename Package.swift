import PackageDescription

let package = Package(
    name: "TwilioAccessToken",
    dependencies: [
      .Package(url: "https://github.com/brentschooley/JSONWebToken.swift", majorVersion: 2, minor: 0)
    ]
)
