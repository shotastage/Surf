//
// Logger.swift
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
import os

public enum SFLogLevel: String {
    case verbose
    case debug
    case info
    case warn
    case error
    case critical

    var emoji: String {
        switch self {
            case .debug: "⚙️"
            case .error: "❌"
            case .critical: "🛑"
            case .verbose: "📄"
            case .info: "ℹ️"
            case .warn: "⚠️"
        }
    }
}

open class SFLogger {
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        return formatter
    }()

    public static func log(_ level: SFLogLevel, file: String = #file, function: String = #function, line: Int = #line, _ message: String = "") {
        printToConsole(logLevel: level, file: file, function: function, line: line, message: message)
        if level == .critical {
            assertionFailure(message)
        }
    }

    public static func verbose(file: String = #file, function: String = #function, line: Int = #line, _ message: String = "") {
        log(.verbose, file: file, function: function, line: line, message)
    }

    public static func debug(file: String = #file, function: String = #function, line: Int = #line, _ message: String = "") {
        log(.debug, file: file, function: function, line: line, message)
    }

    public static func info(file: String = #file, function: String = #function, line: Int = #line, _ message: String = "") {
        log(.info, file: file, function: function, line: line, message)
    }

    public static func warn(file: String = #file, function: String = #function, line: Int = #line, _ message: String = "") {
        log(.warn, file: file, function: function, line: line, message)
    }

    public static func error(file: String = #file, function: String = #function, line: Int = #line, _ message: String = "") {
        log(.error, file: file, function: function, line: line, message)
    }

    public static func critical(file: String = #file, function: String = #function, line: Int = #line, _ message: String = "") {
        log(.critical, file: file, function: function, line: line, message)
    }

    private static func className(from filePath: String) -> String {
        (filePath as NSString).lastPathComponent.components(separatedBy: ".").first ?? ""
    }

    private static func printToConsole(logLevel: SFLogLevel, file: String, function: String, line: Int, message: String) {
        #if DEBUG
        print("\(dateFormatter.string(from: Date())) \(logLevel.emoji) [\(logLevel.rawValue.uppercased())] \(className(from: file)).\(function) #\(line): \(message)")
        #else
        if logLevel == .critical {
            print("\(dateFormatter.string(from: Date())) \(logLevel.emoji) [\(logLevel.rawValue.uppercased())] \(className(from: file)).\(function) #\(line): \(message)")
        }
        #endif
    }
}
