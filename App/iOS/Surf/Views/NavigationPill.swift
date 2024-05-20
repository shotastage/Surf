//
// NavigationPill.swift
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

struct NavigationPill: View {
    var body: some View {
        HStack(spacing: 20) {
            NavigationButton(label: "A")
            NavigationButton(label: "B")
            NavigationButton(label: "C")
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(30)
        .shadow(radius: 5)
    }
}

struct NavigationButton: View {
    let label: String

    var body: some View {
        Button(action: {
            print("Hello")
        }) {
            Text(label)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
                .frame(width: 40, height: 40)
                .background(Color.white)
                .clipShape(Circle())
                .shadow(radius: 3)
        }
    }
}

struct NavigationPill_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    NavigationPill()
                        .padding(.bottom, 16)
                    Spacer()
                }
                .padding(.horizontal, 16)
            }
        }
    }
}
