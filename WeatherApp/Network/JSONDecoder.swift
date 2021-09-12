//
//  JSONDecoder.swift
//  WeatherApp
//
//  Created by Jigar Thakkar on 12/9/21.
//

import Foundation

extension JSONDecoder {
    static let customeDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let string = try container.decode(String.self)
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Incorrect date string found: \(string)"
            )
        }
        return decoder
    }()
}
