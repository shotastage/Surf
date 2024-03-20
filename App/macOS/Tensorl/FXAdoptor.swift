//
//  FXAdoptor.swift
//  Surf
//
//  Created by Shota Shimazu on 2024/03/21.
//

import Combine

protocol FXAdaptor {
    associatedtype InputType
    associatedtype ResultType

    var name: String { get }
    var input: [InputType]? { get }
    var result: ResultType? { get set }

    init(input: [InputType])
    mutating func calc()
}
