//
//  WeatherService.swift
//  SwiftUI-Weather
//
//  Created by Luís Eduardo Marinho Fernandes on 16/10/23.
//

import Foundation
import Combine

class WeatherService: WeatherServiceProtocol {
    let apiClient = URLSessionAPIClient<WeatherEndpoint>()
    
    func getForecast() -> AnyPublisher<WeatherModel, Error> {
        apiClient.request(.getForecast)
    }
    
}
