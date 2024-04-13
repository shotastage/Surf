//
// WebKitBridgeView.swift
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

import SwiftUI
import WebKit

struct WebKitBridgeView: NSViewRepresentable {
    @Binding var currentPage: URL

    // Callbacks
    var onClick: ((URL) -> Void)?
    var onNavigate: ((Bool) -> Void)?
    var onError: ((Error) -> Void)?
    var goBack: (() -> Void)?
    var goNext: (() -> Void)?

    var userAgent: String = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36 Srf/100.0.0.0"

    func makeNSView(context: Context) -> WKWebView {
        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = true

        let config = WKWebViewConfiguration()
        config.preferences = preferences
        config.applicationNameForUserAgent = userAgent

        let webView = WKWebView(frame: .zero, configuration: config)
        webView.navigationDelegate = context.coordinator
        loadRequest(in: webView)
        webView.allowsBackForwardNavigationGestures = true
        return webView
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        SFLogger.info("Update WebKit View Change")

        if nsView.url != currentPage {
            loadRequest(in: nsView)
        }
    }

    private func loadRequest(in webView: WKWebView) {
        let request = URLRequest(url: currentPage)
        webView.load(request)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebKitBridgeView

        init(_ webViewBridgeView: WebKitBridgeView) {
            parent = webViewBridgeView
        }

        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if let url = navigationAction.request.url, navigationAction.navigationType == .linkActivated {
                parent.onClick?(url)
            }
            decisionHandler(.allow)
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            parent.onNavigate?(true)
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.onNavigate?(false)
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            parent.onError?(error)
            SFLogger.info("Failed to load with error: \(error.localizedDescription)")
        }
    }
}

extension WebKitBridgeView {
    func onBack(perform action: @escaping () -> Void) -> Self {
        var updatedView = self
        updatedView.goBack = action
        return updatedView
    }

    func onNext(perform action: @escaping () -> Void) -> Self {
        var updatedView = self
        updatedView.goNext = action
        return updatedView
    }
}

// Preview Provider if needed
struct WebKitBridgeView_Previews: PreviewProvider {
    static var previews: some View {
        // Dummy data or states
        let initialURL = URL(string: "https://magicalsoft.app")!
        @State var currentPage: URL = initialURL

        WebKitBridgeView(
            currentPage: $currentPage,
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
        .frame(width: 800, height: 600)
    }
}
