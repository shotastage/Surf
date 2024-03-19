//
//  BrowserWindow.swift
//  Surf
//
//  Created by Shota Shimazu on 2024/03/19.
//

import AppKit
import Cocoa
import SwiftUI
import WindowManagement

struct BrowserWindow: Scene {
    var body: some Scene {
        Window("Browser", id: SceneID.browserWindow.id) {
            BrowserWindowView()
        }
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.automatic)
        .register(.browserWindow)
        .titlebarAppearsTransparent()
        .transition(.documentWindow)
        .enableOpenWindow()
    }
}
