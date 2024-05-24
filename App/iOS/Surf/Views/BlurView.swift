//
// BlurView.swift
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

struct BlurBackgroundView: UIViewRepresentable {
    var style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

#Preview {
    ZStack {
        HStack {
            VStack {
                Circle()
                    .fill(Color.red)
                Spacer()
            }
            VStack {
                Spacer()
                Circle()
                    .fill(Color.blue)
            }
            VStack {
                Circle()
                    .fill(Color.green)
                Spacer()
            }
        }
        .padding()
        .frame(height: 600.0)
        BlurBackgroundView(style: .regular)
    }
    .ignoresSafeArea()
}
