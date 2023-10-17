//
//  WeatherViewModel.swift
//  SwiftUI-Weather
//
//  Created by Luís Eduardo Marinho Fernandes on 17/10/23.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject, Observable {
    private var cancellables = Set<AnyCancellable>()
    let weatherService: WeatherServiceProtocol
    @Published var weather: WeatherModel? = nil
    
    init(weatherService: WeatherServiceProtocol) {
        self.weatherService = weatherService
    }
    
    func fetchForecast() {
        let datadehj = Date()
        weatherService.getForecast()
            .receive(on: RunLoop.main)
            .sink { data in
            } receiveValue: { [weak self] data in
                self?.weather = data
            }.store(in: &cancellables)
    }
    
}
