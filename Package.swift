// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HPDetailModule",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "HPDetailModule",
            targets: ["HPDetailModule"]),
    ],
    dependencies: [
        .package(url: "https://github.com/engingulek/HPNavigationKit", from: "1.0.0"),
        .package(url: "https://github.com/engingulek/HPNetworkKit", from: "1.0.0"),
        .package(url: "https://github.com/engingulek/HPCoreKit", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "HPDetailModule",
            dependencies: [
                .product(name: "HPNavigationKit", package: "HPNavigationKit"),
                .product(name: "HPNetworkKit", package: "HPNetworkKit"),
                .product(name: "HPCoreKit", package: "HPCoreKit")
            ]
        ),
        .testTarget(
            name: "HPDetailModuleTests",
            dependencies: ["HPDetailModule"]),
    ]
)
