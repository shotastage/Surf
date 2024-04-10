//
// SFGlassButton.swift
//
// Copyright © 2024 Shota Shimazu. All rights reserved.
// Created by Shota Shimazu on 2024/04/10.
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

struct GlassmorphicButton<Content: View>: View {
    let action: () -> Void
    let content: Content
    @Environment(\.colorScheme) var colorScheme

    init(action: @escaping () -> Void, @ViewBuilder content: () -> Content) {
        self.action = action
        self.content = content()
    }

    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(colorScheme == .light ? Color.white.opacity(0.6) : Color.gray.opacity(0.4))
                    .frame(width: 300, height: 200)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25.0)
                            .stroke(Color.white, lineWidth: 2)
                            .shadow(radius: 10)
                            .blur(radius: 5)
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

#Preview("Light View Glass Button") {
    ZStack {
        GlassmorphicButton(action: {
            print("Tap button!")
        }, content: {
            Text("Tap This Button")
                .foregroundColor(.black)
                .font(.title)
        })
    }
    .background(Color(NSColor.quaternarySystemFill))
    .preferredColorScheme(.light)
}

#Preview("Dark View Glass Button") {
    ZStack {
        GlassmorphicButton(action: {
            print("Tap button!")
        }, content: {
            Text("Tap This Button")
                .foregroundColor(.white)
                .font(.title)
        })
    }
    .background(Color.black)
    .preferredColorScheme(.dark)
}
