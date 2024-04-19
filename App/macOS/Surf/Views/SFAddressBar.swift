//
// SFAddressBar.swift
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

import Cocoa
import SwiftUI

struct SFAddressBar: View {
    @Binding var currentPage: URL
    @State private var urlText: String
    @State private var isFocus: Bool = false

    init(currentPage: Binding<URL>) {
        _currentPage = currentPage
        _urlText = State(initialValue: currentPage.wrappedValue.absoluteString)
    }

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(20)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onTapGesture {
                    isFocus = true
                }
            if isFocus {
                VanillaTextFieldBridge(placeholder: $urlText, text: $urlText, isFocus: $isFocus)
                    .frame(maxHeight: .infinity)
                    .padding(.horizontal, 20)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

final class FocusableTextField: NSTextField {
    var onFocusChange: (Bool) -> Void = { _ in }

    override func becomeFirstResponder() -> Bool {
        let textView = window?.fieldEditor(true, for: nil) as? NSTextView
        textView?.insertionPointColor = NSColor(Color.black)
        onFocusChange(true)
        return super.becomeFirstResponder()
    }
}

struct VanillaTextFieldBridge: NSViewRepresentable {
    @Binding var placeholder: String
    @Binding var text: String
    @Binding var isFocus: Bool

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeNSView(context: Context) -> NSTextField {
        let textField = FocusableTextField()
        textField.placeholderString = placeholder
        textField.isBordered = false
        textField.delegate = context.coordinator
        textField.backgroundColor = .clear
        textField.textColor = .black
        textField.focusRingType = .none
        textField.onFocusChange = { isFocus in
            SFLogger.debug("On focus changed")
            self.isFocus = isFocus
        }

        return textField
    }

    func updateNSView(_ nsView: NSTextField, context: Context) {
        nsView.stringValue = text
    }

    class Coordinator: NSObject, NSTextFieldDelegate {
        let parent: VanillaTextFieldBridge

        init(_ textField: VanillaTextFieldBridge) {
            parent = textField
        }

        func controlTextDidEndEditing(_ obj: Notification) {
            parent.isFocus = false
        }

        func controlTextDidChange(_ obj: Notification) {
            guard let textField = obj.object as? NSTextField else { return }
            parent.text = textField.stringValue
        }
    }
}

// Preview Provider if needed
#if DEBUG
struct SFAddressBar_Previews: PreviewProvider {
    static var previews: some View {
        @State var previewURL = URL(string: "https://magicalsoft.app")!
        @State var changingURL = ""
        Group {
            SFAddressBar(currentPage: $previewURL)
                .frame(height: 40)
                .padding()
                .colorScheme(.light)
            SFAddressBar(currentPage: $previewURL)
                .frame(height: 40)
                .padding()
                .colorScheme(.dark)
        }
        .previewDisplayName("SFSearchBar Preview")
    }
}
#endif
