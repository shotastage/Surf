//
//  SurfApp.swift
//  Surf
//
//  Created by Shota Shimazu on 2024/03/05.
//

import AppKit
import SwiftUI
import WindowManagement

@main
struct SurfApp: App {

    @NSApplicationDelegateAdaptor var delegate: AppDelegate

    init() {
        // - enableWindowSizeSaveOnQuit(true)
    }

    var body: some Scene {
        Group {
            BrowserWindow()
        }
    }
}
