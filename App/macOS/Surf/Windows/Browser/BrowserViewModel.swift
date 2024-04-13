//
// BrowserViewModel.swift
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

import Foundation
import Observation

@Observable
final class BrowserViewModel {
    var tabSessions: [TabSession] = []
    var tabIndex: Int
    var changingUrl: String
    var currentPage: URL

    init(initPage: URL) {
        let initTab = TabSession(initPage: initPage)
        tabSessions = [initTab]
        tabIndex = 0
        changingUrl = initPage.description
        currentPage = initPage
    }

    func addTab(session: TabSession) {
        tabSessions.append(session)
    }

    func activateTab(idx: Int) {
        tabIndex = idx
    }

    func updateTab(page: URL) {
        tabSessions[tabIndex].history.append(page)
        tabSessions[tabIndex].currentPage = page
        currentPage = page
    }

    func closeTab(idx: Int) {
        tabSessions.remove(at: idx)
    }
}
