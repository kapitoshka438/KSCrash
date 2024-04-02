// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "KSCrash",
    products: [
        .library(
            name: "KSCrash",
            targets: [
                "KSCrashInstallations",
                "KSCrashRecording",
                "KSCrashRecordingMonitors",
                "KSCrashRecordingTools",
                "KSCrashReportingFilters",
                "KSCrashReportingFiltersTools",
                "KSCrashReportingTools",
                "KSCrashReportingSinks",
                "KSCrashSwiftBasic"
            ]
        )
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "KSCrashInstallations",
            path: "Source/KSCrash/Installations",
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath("../Recording"),
                .headerSearchPath("../Recording/Monitors"),
                .headerSearchPath("../Recording/Tools"),
                .headerSearchPath("../Reporting/Filters"),
                .headerSearchPath("../Reporting/Sinks"),
                .headerSearchPath("../Reporting/Tools"),
            ]
        ),
        .target(
            name: "KSCrashRecording",
            path: "Source/KSCrash/Recording",
            exclude: [
                "Monitors",
                "Tools"
            ],
            resources: [
                .copy("PrivacyInfo.xcprivacy")
            ],
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath("Tools"),
                .headerSearchPath("Monitors"),
                .headerSearchPath("../Reporting/Filters")
            ]
        ),
        .target(
            name: "KSCrashRecordingMonitors",
            path: "Source/KSCrash/Recording/Monitors",
            publicHeadersPath: ".",
            cxxSettings: [
                .define("GCC_ENABLE_CPP_EXCEPTIONS", to: "YES"),
                .headerSearchPath(".."),
                .headerSearchPath("../Tools"),
                .headerSearchPath("../../Reporting/Filters")
            ]
        ),
        .target(
            name: "KSCrashRecordingTools",
            path: "Source/KSCrash/Recording/Tools",
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath(".."),
                .headerSearchPath("../../swift"),
                .headerSearchPath("../../swift/Basic"),
                .headerSearchPath("../../llvm/ADT"),
                .headerSearchPath("../../llvm/Support"),
                .headerSearchPath("../../llvm/Config")
            ]
        ),
        .target(
            name: "KSCrashReportingFilters",
            path: "Source/KSCrash/Reporting/Filters",
            exclude: [
                "Tools"
            ],
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath("Tools"),
                .headerSearchPath("../../Recording"),
                .headerSearchPath("../../Recording/Monitors"),
                .headerSearchPath("../../Recording/Tools")
            ]
        ),
        .target(
            name: "KSCrashReportingFiltersTools",
            path: "Source/KSCrash/Reporting/Filters/Tools",
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath("../../../Recording/Tools")
            ]
        ),
        .target(
            name: "KSCrashReportingTools",
            path: "Source/KSCrash/Reporting/Tools",
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath("../../Recording"),
                .headerSearchPath("../../Recording/Tools")
            ]
        ),
        .target(
            name: "KSCrashReportingSinks",
            path: "Source/KSCrash/Reporting/Sinks",
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath("../Filters"),
                .headerSearchPath("../Filters/Tools"),
                .headerSearchPath("../Tools"),
                .headerSearchPath("../../Recording"),
                .headerSearchPath("../../Recording/Tools"),
                .headerSearchPath("../../Recording/Monitors")
            ]
        ),
        .target(
            name: "KSCrashSwiftBasic",
            path: "Source/KSCrash/swift/Basic",
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath(".."),
                .headerSearchPath("../../llvm/ADT"),
                .headerSearchPath("../../llvm/Config"),
                .headerSearchPath("../../llvm/Support")
            ]
        )
    ],
    cxxLanguageStandard: .gnucxx11
)
