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

    var body: some View {
        VStack {
            TextField("Paste URL here...", text: $currentURL)
            SafariWebView(mesgURL: currentURL)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
