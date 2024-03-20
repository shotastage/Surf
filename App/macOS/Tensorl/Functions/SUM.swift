//
//  SUM.swift
//  Surf
//
//  Created by Shota Shimazu on 2024/03/21.
//

import Foundation

struct FXSum: FXAdaptor {
    typealias InputType = Double
    typealias ResultType = Double

    var name: String
    var input: [Double]?
    var result: Double?

    init(input: [Double]) {
        name = "SUM"
        self.input = input
    }

    mutating func calc() {
        result = input?.reduce(0) { $0 + $1 }
    }
}
