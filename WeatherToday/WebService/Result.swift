//
//  Result.swift
//  WeatherToday
//
//  Created by Sajith Ramavarma on 25/09/18.
//  Copyright © 2018 Applied Materials. All rights reserved.
//


typealias ResultBlock<T> = (Result<T>) -> ()

enum Result<T> {
    case value(T)
    case error(_: String)
}
