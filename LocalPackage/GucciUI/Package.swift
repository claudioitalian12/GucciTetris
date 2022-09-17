// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GucciUI",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "GucciUI",
            targets: [
                "GucciUI"
            ]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(
            name: "BaseGucciTetris",
            path: "../BaseGucciTetris"
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "GucciUI",
            dependencies: [
                "BaseGucciTetris"
            ],
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "GucciUITests",
            dependencies: [
                "GucciUI"
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
