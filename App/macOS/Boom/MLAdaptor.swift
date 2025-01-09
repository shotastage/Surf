//
// MLAdaptor.swift
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

import CoreML
import Foundation

final class ModelManager {
    static let shared = ModelManager()

    private let modelUrl = URL(string: "https://google.com")
    private let modelFileName = "gemma.mlmodel"

    func loadModel(completion: @escaping (MLModel?, Error?) -> Void) {
        let fileManager = FileManager.default
        let modelPath = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]).appendingPathComponent(modelFileName)
        if fileManager.fileExists(atPath: modelPath.path) {
            // If model file exists, load and return
            let model = try? MLModel(contentsOf: modelPath)
            completion(model, nil)
            return
        }

        let downloadTask = URLSession.shared.downloadTask(with: modelUrl!) { tempURL, _, error in
            guard let tempURL, error == nil else {
                completion(nil, error)
                return
            }

            // Unzip the downloaded file
            do {
                // try fileManager.unzipItem(at: tempURL, to: modelPath.deletingLastPathComponent())
                // If unzipping is successful, load the model and complete
                let model = try? MLModel(contentsOf: modelPath)
                completion(model, nil)
            } catch {
                completion(nil, error)
            }
        }
        downloadTask.resume()
    }
}

final class MLController {
    // Now under construction...

    func downloadModel() {}
}
