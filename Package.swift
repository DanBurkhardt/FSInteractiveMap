// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FSInteractiveMap",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "FSInteractiveMap",
            targets: ["FSInteractiveMap"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "FSInteractiveMap",
            path: "FSInteractiveMap/FSInteractiveMap",
            resources: [
                .copy("Data")
            ],
            cSettings: [
                .headerSearchPath("FSInteractiveMap/include")
            ]
        ),
        // TODO: debug import statements
        // in test target
//        .testTarget(
//            name: "FSInteractiveMapTests",
//            dependencies: [
//                "FSInteractiveMap"
//            ],
//            path: "FSInteractiveMapTests",
//            exclude: [
//                "Info.plist"
//            ],
//            cSettings: [
//                .headerSearchPath("FSInteractiveMapTests")
//            ]
//        ),
    ]
)
