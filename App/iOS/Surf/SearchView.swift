//
// SearchView.swift
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

struct SearchView: View {
    @Binding var showSearch: Bool

    var body: some View {
        VStack {
            SearchBarView()
                .frame(width: 450)
            Text("Text Search Bar")
                .font(.largeTitle)
                .padding()

            Button(action: {
                withAnimation(.easeInOut(duration: 0.5)) {
                    showSearch = false
                }
            }) {
                Text("Dismiss")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.opacity(0.8))
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(showSearch: .constant(true))
    }
}
