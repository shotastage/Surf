//
// RandSecure.swift
//
// Copyright © 2024 Shota Shimazu. All rights reserved.
// Created by Shota Shimazu on 2024/03/25.
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

import DataLogic

struct FXRandSecure: FXAdaptor {
    typealias InputType = Double
    typealias ResultType = Double

    var name: String
    var input: [Double]?
    var result: Double?

    init(input: [Double]) {
        name = "RANDSECURE"
        self.input = input
    }

    mutating func calc() {
        if let secureTRNG = SecureTRNG(range: 0.0 ... 1.0) {
            switch secureTRNG.value {
                case let .value(randomValue):
                    switch randomValue {
                        case let .double(doubleValue):
                            result = doubleValue
                        default:
                            SFLogger.info("RandomValue is not Double type.")
                    }
                case .void:
                    SFLogger.info("Value does not exist!")
            }
        }
    }
}
