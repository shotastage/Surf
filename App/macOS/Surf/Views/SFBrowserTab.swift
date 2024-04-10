//
// SFBrowserTab.swift
//
// Copyright © 2024 Shota Shimazu. All rights reserved.
// Created by Shota Shimazu on 2024/04/09.
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
    var body: some View {
        HStack {
            Text("_TAB_VIEW_")
            Text("_TAB_VIEW_")
        }
        .background(Color.blue)
        .frame(height: 60)
        .cornerRadius(10)
        .padding(.all, 5.0)
        .cornerRadius(10)
    }
}

struct SFBrowserTab: View {
    @Binding var selectedTabIndex: Int

    var body: some View {
        HStack {
            ForEach(0 ..< 5) { index in
                GlassmorphicButton(action: {
                    selectedTabIndex = index
                }, content: {
                    Text("Tab \(index + 1)")

                        .foregroundColor(.black)
                        .font(.title)
                })
            }
        }
        .padding()
    }
}

#Preview("Tab View") {
    SFTabView()
}

#Preview("Gathered Tab View") {
    SFBrowserTab(selectedTabIndex: .constant(0))
}
