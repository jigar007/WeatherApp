//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Jigar Thakkar on 2/9/21.
//

import Foundation
import UIKit

protocol NetworkManagerProtocol {
    func fetchWeatherInfo(withCityIDs cityIDs: String, completion: @escaping (Result<[WeatherData], APIError>) -> Void)
}

enum CityId: String {
    case sydney = "2147714"
    case melbourne = "4163971"
    case brisbane = "2174003"
}

struct APIURLManager {
    public static func weatherAPIURL(for cityID: String) -> URL {
        URL(string: Constants.baseURL + Constants.group + "id=\(cityID)&units=\(Constants.system)&APPID=\(Constants.apiKey)")!
    }
}

struct NetworkManager: NetworkManagerProtocol {

    private let httpManager = HTTPManager()

    func fetchWeatherInfo(withCityIDs cityIDs: String, completion: @escaping (Result<[WeatherData], APIError>) -> Void) {
        let weatherURL = APIURLManager.weatherAPIURL(for: cityIDs)

        httpManager.getDataFor(url: weatherURL) { response in
            
            switch response {
            case  .success(let data):
                do {
                    let weatherData = try JSONDecoder.customeDecoder.decode(Wrapper.self, from: data)

                    completion(.success(weatherData.list))
                } catch {
                    completion(.failure(.dataNotDecoded))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
