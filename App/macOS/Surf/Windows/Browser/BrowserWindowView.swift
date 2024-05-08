//
// BrowserWindowView.swift
// Copyright © 2024 Shota Shimazu. All rights reserved.
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
    @State var model = BrowserViewModel(initPage: URL(string: "https://github.com/shotastage/")!)
    @State private var shouldReload: Bool = false

    var body: some View {
        VStack {
            SFBrowserTab(selectedTabIndex: $model.tabIndex, tabSessions: $model.tabSessions)
                .frame(height: 80)
            HStack {
                Button("Home") {
                    navigateToHome()
                }
                Button("Back") {
                    navigatoToBack()
                }
                Button("Next") {
                    navigateToNext()
                }
                Button("Reload") {
                    shouldReload = true
                }
                SFAddressBar(currentPage: $model.currentPage)
                    .frame(height: 40)
                    .onKeyPress(.return) {
                        SFLogger.debug("PressReturn Key")
                        let newPage = URL(string: model.changingUrl)!
                        model.updateTab(page: newPage)

                        return .handled
                    }
                    .onChange(of: model.changingUrl) { _, newValue in
                        SFLogger.debug("Url bar string changed: \(newValue)")
                    }
            }
            .padding(.leading, 80.0)
            .padding(.top, 10.0)
            .padding(.trailing, 10.0)
            WebKitBridgeView(
                currentPage: $model.currentPage, shouldReload: $shouldReload,
                onClick: { url in
                    SFLogger.debug("Web page clicked: \(url)")
                    model.changingUrl = url.absoluteString
                },
                onNavigate: { isStarting in
                    SFLogger.debug(isStarting ? "Navigation has been started." : "Navigation has been ended")
                },
                onError: { error in
                    SFLogger.error("Error has been occured: \(error.localizedDescription)")
                },
                onSiteChanges: { url in
                    SFLogger.debug("URL destination has been changed.")
                    model.changingUrl = url.description
                }
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .edgesIgnoringSafeArea(.top)
    }

    private func navigateToHome() {
        SFLogger.debug("Back to homepage")
        model.updateTab(page: URL(string: "https://google.com")!)
    }

    private func navigatoToBack() {
        SFLogger.info("BACK NAVIGATION IS NOT IMPLEMENTED")
    }

    private func navigateToNext() {
        SFLogger.info("NEXT NAVIGATION IS NOT IMPLEMENTED")
    }
}

#Preview {
    BrowserWindowView()
}
