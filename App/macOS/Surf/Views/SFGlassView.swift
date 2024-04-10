//
// SFGlassView.swift
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

struct GlassmorphicView<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            // Apply glass effect to the view
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.white.opacity(0.6)) // Translucent white
                .frame(width: 300, height: 200)
                .overlay(
                    // Add blur effect
                    RoundedRectangle(cornerRadius: 25.0)
                        .stroke(Color.white, lineWidth: 2)
                        .shadow(radius: 10)
                        .blur(radius: 5) // Strength of blur effect
                        .opacity(0.8) // Opacity of blur effect
                )
                .padding()

            // Add text or other content here
            content
                .foregroundColor(.white)
        }
    }
}

#Preview("Light View") {
    ZStack {
        Color.gray
        GlassmorphicView {
            Text("Glassmorphism Style")
                .foregroundColor(.black)
                .font(.title)
        }
        .preferredColorScheme(.light)
    }
}

#Preview("Dark View") {
    ZStack {
        Color.gray
        GlassmorphicView {
            Text("Glassmorphism Style")
                .foregroundColor(.white)
                .font(.title)
        }
        .preferredColorScheme(.dark)
    }
}
