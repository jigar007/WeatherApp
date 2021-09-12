//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Jigar Thakkar on 12/9/21.
//

import Foundation

struct Wrapper: Decodable {
    var cnt: Int?
    var list: [WeatherData]
}

struct WeatherData: Decodable {
    var main: Main?
    var name: String?
}

struct Main: Codable {
    var temp: Double?
}
