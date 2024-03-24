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
                    print("__BACK__")
                }
                Button("Prev") {
                    print("__PREV__")
                }
                TextField("Paste URL here...", text: $urlStr)
                    .onChange(of: urlStr) { _, newValue in
                        print("Url bar string changed: \(newValue)")
                    }
                    .onSubmit {
                        print("PressReturn Key")
                        currentURL = urlStr
                    }
            }
            WebKitBridgeView(currentPage: $currentURL)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
