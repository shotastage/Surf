//
// LLAMAAdaptor.swift
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

import Foundation

enum LLAMAModelList: String {
    case llama = "https://huggingface.co/TheBloke/Llama-2-7B-Chat-GGUF/resolve/main/llama-2-7b-chat.Q8_0.gguf"
    case gemma = ""

    var url: URL? {
        URL(string: rawValue)
    }
}

final class LLAMAAdaptor {
    private var modelUrl: URL? {
        URL(string: "https://google.com")
    }

    private func downloadModel() {
        let url = URL(string: "https://huggingface.co/TheBloke/Llama-2-7B-Chat-GGUF/resolve/main/llama-2-7b-chat.Q8_0.gguf")!

        let task = URLSession.shared.downloadTask(with: url) { url, _, error in
            if let error {
                print(error)
                return
            }

            guard let url else {
                print("Failed to download model file.")
                return
            }
        }
        task.resume()
    }
}
