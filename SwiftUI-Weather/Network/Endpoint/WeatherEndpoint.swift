//
//  WeatherEndpoint.swift
//  SwiftUI-Weather
//
//  Created by Luís Eduardo Marinho Fernandes on 17/10/23.
//

import Foundation

internal enum WeatherEndpoint: APIEndpoint {
    var baseURL: URL {
        return URL(string: "https://api.weatherapi.com/v1")!
    }
    
    var path: String {
        switch self {
        case .getForecast:
            return "/forecast.json"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getForecast:
            return .get
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getForecast:
            return ["Accept": "application/json"]
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getForecast:
            return [
                "key": Keys.weather_api,
                "q": "Brasilia",
                "days": "7",
                "lang": "en"]
        }
    }
    case getForecast
}
