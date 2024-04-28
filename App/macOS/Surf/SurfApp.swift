//
// SurfApp.swift
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
import Sparkle
import SwiftUI
import WindowManagement

@main
struct SurfApp: App {
    @NSApplicationDelegateAdaptor var delegate: AppDelegate
    private let updaterController: SPUStandardUpdaterController

    init() {
        updaterController = SPUStandardUpdaterController(startingUpdater: true, updaterDelegate: nil, userDriverDelegate: nil)

        enableWindowSizeSaveOnQuit(true)
    }

    var body: some Scene {
        Group {
            BrowserWindow()
        }
        .commands {
            CommandGroup(replacing: .appVisibility) {
                Button(action: {
                    print("Command + R was pressed")
                }) {
                    Text("Reload page")
                }
                .keyboardShortcut("r", modifiers: [.command])
            }
            CommandGroup(after: .appInfo) {
                CheckForUpdatesView(updater: updaterController.updater)
            }
        }
    }
}
