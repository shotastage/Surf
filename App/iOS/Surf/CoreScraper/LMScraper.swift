//
// LMScraper.swift
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

struct ScraperSearchResult {
    let title: String
    let url: URL
}

final class WebKitScraper {
    let webViewInstance: WKWebView
    var result: [ScraperSearchResult]

    init(webViewInstance: WKWebView) {
        self.webViewInstance = webViewInstance
        result = []
    }

    func scrape() -> [String] {
        []
    }

    func nextPage() {}
}

protocol SearchProviderAdaptor {
    func search(query: String) -> [String]
    func getSearchResults(query: String) -> [String]
}
