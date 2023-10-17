// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherModel = try? JSONDecoder().decode(WeatherModel.self, from: jsonData)

import Foundation

// MARK: - WeatherModel
struct WeatherModel: Codable {
    let location: Location?
    let current: Current?
    let forecast: Forecast?
}

// MARK: - Current
struct Current: Codable {
    let lastUpdated: String?
    let tempC: Double?
    let isDay: Int?
    let condition: Condition?

    enum CodingKeys: String, CodingKey {
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case isDay = "is_day"
        case condition
    }
}

// MARK: - Condition
struct Condition: Codable {
        let text: WeatherText?
    
    enum CodingKeys: String, CodingKey {
        case text = "Text"
    }
}

enum WeatherText: String, Codable {
    case clear = "Clear"
    case partlyCloudy = "Partly cloudy"
    case patchyRainPossible = "Patchy rain possible"
    case sunny = "Sunny"
}

// MARK: - Forecast
struct Forecast: Codable {
    let forecastday: [Forecastday]?
}

// MARK: - Forecastday
struct Forecastday: Codable {
    let date: String?
    let day: Day?

    enum CodingKeys: String, CodingKey {
        case date
        case day
    }
}

// MARK: - Day
struct Day: Codable {
    let avgtempC: Double?
    let condition: Condition?

    enum CodingKeys: String, CodingKey {
        case avgtempC = "avgtemp_c"
        case condition
    }
}


// MARK: - Location
struct Location: Codable {
    let name: String?
    let localtime: String?

    enum CodingKeys: String, CodingKey {
        case name
        case localtime
    }
}
