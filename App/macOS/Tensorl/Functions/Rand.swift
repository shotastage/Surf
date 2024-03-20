//
//  Rand.swift
//  Surf
//
//  Created by Shota Shimazu on 2024/03/21.
//

import Foundation

struct FXRand: FXAdaptor {
    typealias InputType = Double
    typealias ResultType = Double

    var name: String
    var input: [Double]?
    var result: Double?

    init(input: [Double]) {
        name = "RAND"
        self.input = input
    }

    mutating func calc() {
        result = Double.random(in: 0 ... 1)
    }
}
