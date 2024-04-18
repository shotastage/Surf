//
// ContentView.swift
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

struct ContentView: View {
    @State private var currentPage: URL = .init(string: "https://magicalsoft.app")!
    @State private var shouldReload = false
    var body: some View {
        WebKitBridgeView(
            currentPage: $currentPage, shouldReload: $shouldReload,
            onClick: { url in
                print("Web page clicked: \(url)")
            },
            onNavigate: { _ in
            },
            onError: { error in
                print("Error has been occured: \(error.localizedDescription)")
            },
            onSiteChanges: { _ in
                print("URL destination has been changed.")
            }
        )
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
