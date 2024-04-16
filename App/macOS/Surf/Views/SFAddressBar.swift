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

class PaddedTextField: NSTextField {
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct SFAddressBar: NSViewRepresentable {
    @Binding var text: String
    var onReturn: (() -> Void)? = nil

    func makeNSView(context: Context) -> NSTextField {
        let textField = PaddedTextField()
        let textFieldLayer = CALayer()

        textField.delegate = context.coordinator
        textField.wantsLayer = true
        textField.layer = textFieldLayer
        textField.layer?.backgroundColor = Color.blue.cgColor
        textField.layer?.borderColor = Color.red.cgColor
        textField.layer?.borderWidth = 1
        textField.layer?.cornerRadius = 5
        textField.layer?.masksToBounds = true
        textField.textColor = NSColor.black
        textField.layer?.masksToBounds = true

        return textField
    }

    func updateNSView(_ nsView: NSTextField, context: Context) {
        nsView.stringValue = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, NSTextFieldDelegate {
        var parent: SFAddressBar

        init(_ textField: SFAddressBar) {
            parent = textField
        }

        func controlTextDidChange(_ obj: Notification) {
            if let textField = obj.object as? NSTextField {
                parent.text = textField.stringValue
            }
        }

        func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
            if commandSelector == #selector(NSResponder.insertNewline(_:)) {
                parent.onReturn?()
                return true
            }
            return false
        }
    }
}

extension SFAddressBar {
    func onReturn(_ action: @escaping () -> Void) -> some View {
        var copy = self
        copy.onReturn = action
        return copy
    }
}

// Preview Provider if needed
struct SFAddressBar_Previews: PreviewProvider {
    static var previews: some View {
        @State var previewURL = "https://magicalsoft.app"

        SFAddressBar(text: $previewURL)
            .padding()
    }
}
