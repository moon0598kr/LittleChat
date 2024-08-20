import ProjectDescription

let project = Project(
    name: "LittleChat",
    packages: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.0.0")
    ],
    targets: [
        .target(
            name: "LittleChat",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.LittleChat",
            infoPlist: .extendingDefault(
                with: [
                    //                    "UILaunchScreen": [
                    //                        "UIColorName": "",
                    //                        "UIImageName": "",
                    //                    ],
                    "UILaunchStoryboardName": "LaunchScreen",
                    "UIMainStoryboardFile": "Main"  // Main.storyboard를 메인으로 설정
                ]
            ),
            sources: ["LittleChat/Sources/**"],
            resources: ["LittleChat/Resources/**", "LittleChat/Resources/Main.storyboard"],
            dependencies: [
                .package(product: "RxSwift")
            ],
            settings: .settings(base:
                ["CODE_SIGN_IDENTITY": "Apple Development",
                 "DEVELOPMENT_TEAM": "Tae Hyeong Kim"])
        ),
        .target(
            name: "LittleChatTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.LittleChatTests",
            infoPlist: .default,
            sources: ["LittleChat/Tests/**"],
            resources: [],
            dependencies: [.target(name: "LittleChat")]
        )
    ]
)
