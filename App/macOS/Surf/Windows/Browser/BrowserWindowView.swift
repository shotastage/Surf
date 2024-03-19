//
//  BrowserWindowView.swift
//  Surf
//
//  Created by Shota Shimazu on 2024/03/19.
//

import AppKit
import Foundation
import SwiftUI
import WindowManagement

struct BrowserWindowView: View {
    @Environment(\.window) var window

    @State private var data = Array(repeating: Array(repeating: "", count: 10), count: 20)

    var body: some View {
        ZStack {
            VStack {
                Text("<<Browser area>>")
            }
            .padding(.horizontal, 0.0)
        }
    }
}
