//
//  WeatherServiceProtocol.swift
//  SwiftUI-Weather
//
//  Created by Luís Eduardo Marinho Fernandes on 16/10/23.
//

import Foundation
import Combine

protocol WeatherServiceProtocol {
    func getForecast() -> AnyPublisher<WeatherModel, Error>
}


