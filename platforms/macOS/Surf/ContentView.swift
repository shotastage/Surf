//
//  ContentView.swift
//  Surf
//
//  Created by Shota Shimazu on 2024/03/05.
//

import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        SafariWebView(mesgURL: "https://magicalsoft.app")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
