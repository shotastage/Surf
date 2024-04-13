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
    @State var model = BrowserViewModel(initPage: URL(string: "https://google.com")!)

    var body: some View {
        VStack {
            SFBrowserTab(selectedTabIndex: model.tabIndex)
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
                SFAddressBar(text: model.changingUrl)
                    .onReturn {
                        SFLogger.info("PressReturn Key")
                        let newPage = URL(string: model.changingUrl)!
                        model.updateTab(page: newPage)
                    }
                    .onChange(of: model.changingUrl) { _, newValue in
                        SFLogger.info("Url bar string changed: \(newValue)")
                    }
            }
            .padding(.leading, 80.0)
            .padding(.top, 10.0)
            .padding(.trailing, 10.0)
            WebKitBridgeView(
                currentPage: $model.currentPage,
                isLoading: $model.isLoading,
                onClick: { url in
                    print("Web page clicked: \(url)")
                },
                onNavigate: { isStarting in
                    print(isStarting ? "Navigation has been started." : "Navigation has been ended")
                },
                onError: { error in
                    print("Error has been occured: \(error.localizedDescription)")
                }
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .edgesIgnoringSafeArea(.top)
    }

    private func navigateToHome() {
        SFLogger.info("__HOME__")
        model.tabSessions[model.tabIndex] = TabSession(initPage: URL(string: "https://google.com")!)
        // model.updateTab(page: URL(string: "https://google.com") ?? URL(fileURLWithPath: ""))
    }

    private func navigatoToBack() {
        SFLogger.info("__BACK__")
    }

    private func navigateToNext() {
        SFLogger.info("__NEXT__")
    }
}

#Preview {
    BrowserWindowView()
}
