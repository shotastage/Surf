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

struct TabAppearanceView<Content: View>: View {
    let action: () -> Void
    let content: Content
    var cornerRadius: CGFloat
    var width: CGFloat
    var height: CGFloat
    @Environment(\.colorScheme) var colorScheme

    init(cornerRadius: CGFloat = 25.0, width: CGFloat = 140, height: CGFloat = 40, action: @escaping () -> Void, @ViewBuilder content: () -> Content) {
        self.cornerRadius = cornerRadius
        self.width = width
        self.height = height
        self.action = action
        self.content = content()
    }

    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(colorScheme == .light ? Color.white.opacity(0.6) : Color.gray.opacity(0.4))
                    .frame(width: width, height: height)
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(Color(red: 0.878, green: 0.878, blue: 0.878), lineWidth: 0.5)
                            .shadow(radius: 10)
                            .opacity(0.8)
                    )
                    .padding()

                content
                    .foregroundColor(.white)
            }
        }
        .buttonStyle(PlainButtonStyle()) // Remove default button styling
    }
}

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

    let tabMaxWidth: CGFloat = 100

    var body: some View {
        HStack {
            ForEach(0 ..< 5) { index in
                TabAppearanceView(cornerRadius: 12, width: tabMaxWidth, height: 40, action: {
                    selectedTabIndex = index
                }, content: {
                    HStack {
                        Image("Pictograms")
                            .resizable()
                            .frame(width: 35, height: 35)
                        // Text("F")
                        //    .foregroundColor(.black)
                        //    .bold()
                        // Text("Web Site \(index + 1)")
                        //    .foregroundColor(.black)
                        //    .font(.system(size: 13))
                    }
                    .frame(maxWidth: tabMaxWidth - 25)
                })
            }
        }
        .padding()
    }

    private func extractTabInfo(idx: Int) -> (String, String) {
        (tabSessions[idx].currentPage.description, tabSessions[idx].currentPage.absoluteString)
    }
}

#if DEBUG
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
#endif

#Preview("Light View Glass Button") {
    ZStack {
        TabAppearanceView(cornerRadius: 12.0, action: {
            print("Tap button!")
        }, content: {
            Text("Tap This Button")
                .fontWeight(.bold)
                .foregroundColor(.black)
                .font(.callout)
                .lineLimit(1)
        })
    }
    .background(Color(NSColor.quaternarySystemFill))
    .preferredColorScheme(.light)
}

#Preview("Tab View") {
    SFTabView(text: .constant("Tab Title"), imgUrl: .constant("IMG"))
}
