//
//  BrowserWindowView.swift
//  Surf
//
//  Created by Shota Shimazu on 2024/03/19.
//

import AppKit
import Foundation
import SwiftUI
import WindowManagement

struct BrowserWindowView: View {
    @Environment(\.window) var window

    @State private var currentURL = "https://github.com/shotastage/Surf"
    @State private var urlStr = "https://github.com/shotastage/Surf"

    var body: some View {
        VStack {
            HStack {
                Button("Back") {
                    SFLogger.info("__BACK__")
                }
                Button("Prev") {
                    SFLogger.info("__PREV__")
                }
                TextField("Paste URL here...", text: $urlStr)
                    .onChange(of: urlStr) { _, newValue in
                        SFLogger.info("Url bar string changed: \(newValue)")
                    }
                    .onSubmit {
                        SFLogger.info("PressReturn Key")
                        currentURL = urlStr
                    }
            }
            WebKitBridgeView(currentPage: $currentURL)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
