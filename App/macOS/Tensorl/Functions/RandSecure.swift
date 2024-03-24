//
//  RandSecure.swift
//  Surf
//
//  Created by Shota Shimazu on 2024/03/21.
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
