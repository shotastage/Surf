//
//  MLAdaptor.swift
//  Surf
//
//  Created by Shota Shimazu on 2024/04/05.
//

import Foundation
import CoreML


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
        
        let downloadTask = URLSession.shared.downloadTask(with: modelUrl!) { (tempURL, response, error) in
        guard let tempURL = tempURL, error == nil else {
            completion(nil, error)
            return
        }

        // ダウンロードしたファイルを解凍
        do {
            try fileManager.unzipItem(at: tempURL, to: modelPath.deletingLastPathComponent())
            // 解凍が成功したら、モデルをロードして完了
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

    func downloadModel() {
        
    }
}
