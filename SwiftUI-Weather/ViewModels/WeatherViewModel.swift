//
//  WeatherViewModel.swift
//  SwiftUI-Weather
//
//  Created by Luís Eduardo Marinho Fernandes on 17/10/23.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    let weatherService: WeatherServiceProtocol
    @Published var weather: WeatherModel? = nil
    
    init(weatherService: WeatherServiceProtocol) {
        self.weatherService = weatherService
    }
    
    func fetchForecast() {
        weatherService.getForecast()
            .receive(on: RunLoop.main)
            .sink { data in
                print(data)
            } receiveValue: { [weak self] data in
                print(data)
                self?.weather = data
            }.store(in: &cancellables)
    }
    
}
