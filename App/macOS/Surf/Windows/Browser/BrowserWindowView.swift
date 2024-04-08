//
// BrowserWindowView.swift
//
// Copyright © 2024 Shota Shimazu. All rights reserved.
// Created by Shota Shimazu on 2024/03/25.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//	https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import AppKit
import Foundation
import SwiftUI
import WindowManagement

struct BrowserWindowView: View {
    @Environment(\.window) var window

    @State private var currentURL = "https://shotastage.github.io/minimum-styled/"
    @State private var urlStr = "https://shotastage.github.io/minimum-styled/"

    @State private var history: [String] = [
        "https://shotastage.github.io/minimum-styled/",
    ]

    var body: some View {
        VStack {
            HStack {
                Button("Home") {
                    SFLogger.info("__HOME__")
                    currentURL = "https://google.com"
                    urlStr = "https://google.com"
                }
                Button("Back") {
                    SFLogger.info("__BACK__")
                }
                Button("Next") {
                    SFLogger.info("__NEXT__")
                }
                SFAddressBar(text: $urlStr)
                    .onReturn {
                        SFLogger.info("PressReturn Key")
                        currentURL = urlStr
                    }
                    .onChange(of: urlStr) { _, newValue in
                        SFLogger.info("Url bar string changed: \(newValue)")
                    }
            }
            .padding(.horizontal, 10.0)
            WebKitBridgeView(currentPage: $currentURL)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    BrowserWindowView()
}
