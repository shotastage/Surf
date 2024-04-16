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
    let placeholder: String
    @Binding var text: String
    @State private var isFocus: Bool = false

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(isFocus ? .white : .gray)
                .frame(height: 50)
                .cornerRadius(20)
            VanilaTextFieldBridge(placeholder: placeholder, text: $text, isFocus: $isFocus)
                .frame(height: 40)
                .padding(.horizontal, 20)
        }
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

struct VanilaTextFieldBridge: NSViewRepresentable {
    let placeholder: String
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
            self.isFocus = isFocus
        }

        return textField
    }

    func updateNSView(_ nsView: NSTextField, context: Context) {
        nsView.stringValue = text
    }

    class Coordinator: NSObject, NSTextFieldDelegate {
        let parent: VanilaTextFieldBridge

        init(_ textField: VanilaTextFieldBridge) {
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
        @State var previewURL = "https://magicalsoft.app"

        Group {
            SFAddressBar(placeholder: "Search bar", text: $previewURL)
                .padding()
                .colorScheme(.light)
            SFAddressBar(placeholder: "Search bar", text: $previewURL)
                .padding()
                .colorScheme(.dark)
        }
        .previewDisplayName("SFSearchBar Preview")
    }
}
#endif
