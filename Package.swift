// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "RxUtils",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "RxUtils",
            targets: ["RxUtils"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.1.1")
    ],
    targets: [
        .target(
            name: "RxUtils",
            dependencies: ["RxSwift", "RxCocoa"],
            path: "Sources"
        )
    ]
)
