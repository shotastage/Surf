//
// SFBrowserTab.swift
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

struct SFTabView: View {
    @Binding var text: String
    @Binding var imgUrl: String

    var body: some View {
        HStack {
            Text(text)
                .foregroundColor(.black)
                .font(.system(size: 15))
        }
    }
}

struct SFBrowserTab: View {
    @Binding var selectedTabIndex: Int
    @Binding var tabSessions: [TabSession]

    var body: some View {
        HStack {
            ForEach(0 ..< 5) { index in
                GlassmorphicButton(cornerRadius: 13, width: 150, height: 40, action: {
                    selectedTabIndex = index
                }, content: {
                    Text("Web Site \(index + 1)")
                        .foregroundColor(.black)
                        .font(.system(size: 15))
                })
            }
        }
        .padding()
    }

    private func extractTabInfo(idx: Int) -> (String, String) {
        (tabSessions[idx].currentPage.description, tabSessions[idx].currentPage.absoluteString)
    }
}

struct SFBrowserTab_Previews: PreviewProvider {
    static let tabSessions = [
        TabSession(initPage: URL(string: "https://magicalsoft.apps")!),
        TabSession(initPage: URL(string: "https://shotach.com")!),
        TabSession(initPage: URL(string: "https://github.com/shotastage/")!),
        TabSession(initPage: URL(string: "https://google.com")!),
    ]

    static var previews: some View {
        SFBrowserTab(selectedTabIndex: .constant(0), tabSessions: .constant(tabSessions))
    }
}

#Preview("Tab View") {
    SFTabView(text: .constant("Tab Title"), imgUrl: .constant("IMG"))
}
