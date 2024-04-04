// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OverlayScript",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "OverlayScript",
            targets: ["OverlayScript"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "OverlayScript",
            dependencies: ["OverlayScriptBackend"],
            swiftSettings: [
                .interoperabilityMode(.Cxx)
            ]),
        .target(
            name: "OverlayScriptBackend",
            path: "lib",
            exclude: ["main.cpp"],
            sources: ["."]
            //publicHeadersPath: "../include/",
            //swiftSettings: [.interoperabilityMode(.Cxx),
            //swiftSettings: [
            //    .interoperabilityMode(.Cxx)
            //]
        ),
        .testTarget(
            name: "OverlayScriptTests",
            dependencies: ["OverlayScript"]),
    ],
    cxxLanguageStandard: .cxx17
)
