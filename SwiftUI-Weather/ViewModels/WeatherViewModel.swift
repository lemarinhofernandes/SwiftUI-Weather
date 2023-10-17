//
//  WeatherViewModel.swift
//  SwiftUI-Weather
//
//  Created by Luís Eduardo Marinho Fernandes on 17/10/23.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject, Observable {
    
    // MARK: -PROPERTIES
    private var cancellables = Set<AnyCancellable>()
    let weatherService: WeatherServiceProtocol
    @Published var weather: WeatherModel? = nil
    @Published var forecastDays: [Forecastday]? = [Forecastday]()
    
    
    // MARK: -INITIALIZERS
    init(weatherService: WeatherServiceProtocol) {
        self.weatherService = weatherService
    }
    
    // MARK: -PUBLIC METHODS
    func getIcon(_ text: WeatherText?) -> String {
        switch text {
        case .clear:
            return "moon.fill"
        case .partlyCloudy:
            return "cloud.sun.fill"
        case .patchyRainPossible:
            return "cloud.rain.fill"
        case .sunny:
            return "sun.max.fill"
        case .none:
            return String()
        }
    }
    
    func getWeekDay(_ day: String?) -> String {
        let weekDay = Date().dayOfWeek(day ?? String())
        switch weekDay{
            case 1:
                return WeekDays.sunday
            case 2:
                return WeekDays.monday
            case 3:
                return WeekDays.tuesday
            case 4:
                return WeekDays.wednsday
            case 5:
                return WeekDays.thursday
            case 6:
                return WeekDays.friday
            case 7:
                return WeekDays.saturday
            case .none:
                return "uninplemented"
            case .some(_):
                return "uninplemented"
        }
    }
    
    func fetchForecast() {
        weatherService.getForecast()
            .receive(on: RunLoop.main)
            .sink { data in
                
            } receiveValue: { [weak self] data in
                self?.weather = data
                self?.setForecast()
                print(data)
            }.store(in: &cancellables)
    }
    
    // MARK: -PRIVATE METHODS
    private func setForecast() {
        for aditionalNumber in 1...5 {
            let day = getDay(aditionalNumber)
            let element = weather?.forecast?.forecastday?.first(where: { $0.date == day })
            guard let element = element else { return }
            forecastDays?.append(element)
        }
        
    }
    
    private func getDay(_ add: Int) -> String {
        let timeStamp = Date.now.description.split(separator: " ").first?.split(separator: "-")
        let today = timeStamp?.last
        
        guard let timeStamp = timeStamp, let today = today else {
            return String()
        }
        
        let respectiveday = (Int(today) ?? 0) + add
        return "\(timeStamp[0])-\(timeStamp[1])-\(respectiveday)"
    }
    
}

public enum WeekDays {
    static let monday = "MON"
    static let tuesday = "TUE"
    static let wednsday = "WED"
    static let thursday = "THU"
    static let friday = "FRI"
    static let saturday = "SAT"
    static let sunday = "SUN"
}
