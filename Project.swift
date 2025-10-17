import ProjectDescription

let project = Project(
    name: "jpdbiOS",
    targets: [
        .target(
            name: "jpdbiOS",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.jpdbiOS",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            buildableFolders: [
                "jpdbiOS/Sources",
                "jpdbiOS/Resources",
            ],
            dependencies: [
                .external(name: "HotSwiftUI"),
            ],
            settings: .settings(
                base: [
                    "OTHER_LDFLAGS": [
                        "$(inherited)", // Always include this to preserve default linker flags
                        "-Xlinker", // Passes the next argument directly to the linker
                        "-interposable", // The actual linker flag for HotSwiftUI
                    ],
                    // User defined build setting for HotSwiftUI
                    "EMIT_FRONTEND_COMMAND_LINES": "YES",
                ]
            )
        ),
        .target(
            name: "jpdbiOSTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.jpdbiOSTests",
            infoPlist: .default,
            buildableFolders: [
                "jpdbiOS/Tests",
            ],
            dependencies: [.target(name: "jpdbiOS")]
        ),
    ]
)
