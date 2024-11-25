//
//  StatusBarSimulationPage.swift
//  xcode-and-playgrounds
//
//  Created by Kouki Saito on 2024/10/11.
//

import SwiftUI

struct StatusBarSimulationPage: View {
    @Environment(\.dismiss)
    var dismiss

    var body: some View {
        VStack(alignment: .leading) {
            StatusBarSimulation(spec: .iPhone)
                .padding(.top, 14 + 50)
            Rectangle()
                .frame(maxWidth: .infinity)
                .foregroundStyle(Color.clear)
            Spacer()
            Button("Dismiss") {
                dismiss()
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

var formatters: [Locale: DateFormatter] = [:]
func formatter(for locale: Locale) -> DateFormatter  {
    if let formatter = formatters[locale] {
        return formatter
    } else {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.setLocalizedDateFormatFromTemplate("EEE MMM dd")
        formatters[locale] = formatter
        return formatter
    }
}

struct StatusBarSimulation: View {
    @Environment(\.locale)
    var locale

    enum Spec {
        case iPhone
        case iPad
    }

    var spec: Spec

    var body: some View {
        switch spec {
        case .iPhone:
            // Hard coding appearance of iPhone 16 Pro
            HStack {
                Spacer()
                    .overlay {
                        Text("9:41")
                            .font(.system(size: 18, weight: .semibold))
                    }
                Capsule()
                    .frame(width: 125.5, height: 37)
                Spacer()
                    .overlay {
                        HStack(spacing: 3) {
                            Image(systemName: "cellularbars")
                            Image(systemName: "wifi")
                            Image(systemName: "battery.100percent")
                                .symbolRenderingMode(.multicolor)
                                .imageScale(.large)
                        }
                        .font(.system(size: 17, weight: .light))
                    }
            }
            .padding(.horizontal, 10)
            .padding(.top, 14)
        case .iPad:
            // Hard coding appearance of iPad Pro 13 inch
            HStack {
                let date = formatter(for: locale)
                    .string(from: Date())
                    // In English, formatted text is like `Tue, Nov 26`, but the status's text is `Tue Nov 26(, ommitted)`.
                    // I didn't understand specifying this format. Workaround with string replacement to replicate this behavior.
                    // It is only tested in Japanese and English.
                    .replacingOccurrences(of: ",", with: "")
                HStack(spacing: 10) {
                    Text("9:41")
                    Text(date)
                    Spacer()
                }
                .font(.system(size: 12, weight: .medium))
                .padding(.leading, 2)
                Image(systemName: "ellipsis")
                    .imageScale(.large)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(Color.gray)
                HStack(spacing: 1.5) {
                    Spacer()
                    Image(systemName: "wifi")
                        .font(.system(size: 12.5))
                        .padding(.trailing, 1)
                    Text("100%")
                        .font(.system(size: 12, weight: .medium))
                    Image(systemName: "battery.100percent")
                        .symbolRenderingMode(.multicolor)
                        .imageScale(.large)
                        .font(.system(size: 14.5))

                }
            }
            .padding(.horizontal, 23)
            .padding(.top, 4)
        }
    }
}

#Preview {
    StatusBarSimulationPage()
    StatusBarSimulation(spec: .iPad)
    StatusBarSimulation(spec: .iPad)
        .environment(\.locale, .init(identifier: "ja_JP"))
}

