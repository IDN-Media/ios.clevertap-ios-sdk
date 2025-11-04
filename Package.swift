// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "CleverTapSDK",
    platforms: [
        .iOS(.v9),
        .watchOS(.v2)
    ],
    products: [
        .library(
            name: "CleverTapSDK",
            targets: ["CleverTapSDKWrapper"]),
        .library(
            name: "CleverTapLocation",
            targets: ["CleverTapLocation"]
        ),
        .library(
            name: "CleverTapWatchOS",
            targets: ["CleverTapWatchOS"]
        )
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "SDWebImage-IDN",
            url: "https://github.com/SDWebImage/SDWebImage/releases/download/5.21.3/SDWebImage-dynamic.xcframework.zip",
            checksum: "1a5e635fa4f9525c91631928dd54e9dd3117ec02b9c9757d4e36ab5d06600aef"
        ),
        .binaryTarget(
            name: "CleverTapSDK",
            url: "https://d1new0xr8otir0.cloudfront.net/CleverTapSDK-7.3.4.xcframework.zip",
            checksum: "2b093b4d6591cc431e1708b8bb99f42b9726d848e42d70096523ee1d90bbc859"
        ),
        .target(
            name: "CleverTapLocation",
            path: "CleverTapLocation",
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("./"),
                .headerSearchPath("CleverTapLocation/"),
                .headerSearchPath("CleverTapLocation/Classes/"),
                .headerSearchPath("CleverTapLocation/Classes")
            ],
            linkerSettings: [
                .linkedFramework("CoreLocation")
            ]
        ),
        .target(
            name: "CleverTapSDKWrapper",
            dependencies: [
                "CleverTapSDK",
                "SDWebImage-IDN"
            ],
            path: "CleverTapSDKWrapper",
            linkerSettings: [
                .linkedLibrary("sqlite3")
            ]
        ),
        .target(
            name: "CleverTapWatchOS",
            dependencies: [],
            path: "CleverTapWatchOS",
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("./"),
                .headerSearchPath("CleverTapWatchOS/")
            ]
        )
    ]
)
