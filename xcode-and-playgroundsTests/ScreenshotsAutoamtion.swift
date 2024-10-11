//
//  ScreenshotsAutoamtion.swift
//  xcode-and-playgroundsTests
//
//  Created by Kouki Saito on 2024/10/11.
//

import Testing
import SnapshotTesting
import SwiftUI
@testable import xcode_and_playgrounds

@MainActor
struct ScreenshotsAutoamtion {

    @Test
    func aaa() async throws {
        let deviceList: [Device] = [
            .iPhone,
            .iPad,
        ]
        let localeList: [String] = [
            "ja-JP",
            "en-US",
        ]
        for device in deviceList {
            for localeIdentifier in localeList {
                withKnownIssue {
                    withSnapshotTesting(record: .all) {
                        assertSnapshot(
                            of: UIHostingController(
                                rootView: ContentView()
                                    .withStatusBar(spec: device.spec)
                                    .environment(\.locale, Locale(identifier: localeIdentifier))
                            ),
                            as: .image(
                                on: device.viewImageConfig,
                                traits: device.traits
                            ),
                            named: "\(device.name)_\(localeIdentifier)"
                        )
                    }
                }
            }
        }
    }
}

extension View {
    @ViewBuilder
    func withStatusBar(spec: StatusBarSimulation.Spec) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .top) {
                StatusBarSimulation(spec: spec)
                    .ignoresSafeArea()
            }
    }
}

enum Device {
    case iPhone
    case iPad

    var name: String {
        switch self {
        case .iPhone:
            "iPhone"
        case .iPad:
            "iPad"
        }
    }

    var viewImageConfig: ViewImageConfig {
        switch self {
        case .iPhone:
            // iPhone 16 Pro Max
            ViewImageConfig(
                safeArea: .init(top: 62, left: 0, bottom: 34, right: 0),
                size: .init(width: 440, height: 956),
                traits: .iPhone13ProMax(.portrait)
            )
        case .iPad:
            // iPad Pro 13 inch
            ViewImageConfig(
                safeArea: .init(top: 24, left: 0, bottom: 20, right: 0),
                size: .init(width: 1376, height: 1032),
                traits: .iPadPro12_9
            )
        }
    }

    var traits: UITraitCollection {
        switch self {
        case .iPhone:
            // iPhone 16 Pro Max
            .init(displayScale: 3.0)
        case .iPad:
            // iPad Pro 13 inch
            .init(displayScale: 2.0)
        }
    }

    var spec: StatusBarSimulation.Spec {
        switch self {
        case .iPhone:
            .iPhone
        case .iPad:
            .iPad
        }
    }
}
