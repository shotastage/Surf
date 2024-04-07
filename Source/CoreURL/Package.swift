// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreURL",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CoreURL",
            targets: ["CoreURL"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CoreURL",
            dependencies: ["CoreURLBackend"],
            swiftSettings: [
                .interoperabilityMode(.Cxx),
            ]
        ),
        .target(
            name: "CoreURLBackend",
            path: "lib",
            exclude: ["main.cpp"],
            sources: ["."]
            // publicHeadersPath: "../include/",
            // swiftSettings: [.interoperabilityMode(.Cxx),
            // swiftSettings: [
            //    .interoperabilityMode(.Cxx)
            // ]
        ),
        .testTarget(
            name: "CoreURLTests",
            dependencies: ["CoreURL"]
        ),
    ],
    cxxLanguageStandard: .cxx17
)
