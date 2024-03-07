//
//  SFWebKit.swift
//  Surf
//
//  Created by Shota Shimazu on 2024/03/08.
//

import SwiftUI
import WebKit

struct SFWebKitView: NSViewRepresentable {
    let url: URL

    func makeNSView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        nsView.load(request)
    }
}

#Preview {
    SFWebKitView(url: URL(string: "https://magicalsoft.app")!)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
}
