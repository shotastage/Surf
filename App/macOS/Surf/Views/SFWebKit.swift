//
// SFWebKit.swift
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

class WebViewModel: ObservableObject {
    @Published var link: String
    @Published var didFinishLoading: Bool = false
    @Published var pageTitle: String = ""

    init(link: String) {
        self.link = link
    }
}

struct WebView: NSViewRepresentable {
    typealias NSViewType = WKWebView

    @ObservedObject var viewModel: WebViewModel

    func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.uiDelegate = context.coordinator
        if let url = URL(string: viewModel.link) {
            webView.load(URLRequest(url: url))
        }
        return webView
    }

    func updateNSView(_ nsView: WKWebView, context _: Context) {
        if let url = URL(string: viewModel.link), nsView.url != url {
            nsView.load(URLRequest(url: url))
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(viewModel)
    }

    class Coordinator: NSObject, WKNavigationDelegate, WKUIDelegate {
        var viewModel: WebViewModel

        init(_ viewModel: WebViewModel) {
            self.viewModel = viewModel
        }

        func webView(_: WKWebView, didFail _: WKNavigation!, withError _: Error) {
            // Handle failure
        }

        func webView(_: WKWebView, didFailProvisionalNavigation _: WKNavigation!, withError _: Error) {
            // Handle provisional failure
        }

        func webView(_ web: WKWebView, didFinish _: WKNavigation!) {
            if let title = web.title {
                viewModel.pageTitle = title
            }
            if let urlString = web.url?.absoluteString {
                viewModel.link = urlString
            }
            viewModel.didFinishLoading = true
        }

        func webView(_: WKWebView, didStartProvisionalNavigation _: WKNavigation!) {
            // Handle start of navigation
        }

        func webView(_: WKWebView, decidePolicyFor _: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            decisionHandler(.allow)
        }
    }
}

struct SafariWebView: View {
    @StateObject var model: WebViewModel

    init(mesgURL: String) {
        _model = StateObject(wrappedValue: WebViewModel(link: mesgURL))
    }

    var body: some View {
        WebView(viewModel: model)
    }
}

// Preview Provider if needed
#Preview("SFWebView") {
    SafariWebView(mesgURL: "https://magicalsoft.app/")
}
