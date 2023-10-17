// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherModel = try? JSONDecoder().decode(WeatherModel.self, from: jsonData)

import Foundation
import OptionallyDecodable // https://github.com/idrougge/OptionallyDecodable

// MARK: - WeatherModel
struct WeatherModel: Codable, Sendable {
    let location: Location?
    let current: Current?
    let forecast: Forecast?
}

// MARK: - Current
struct Current: Codable, Sendable {
    let lastUpdatedEpoch: Int?
    let lastUpdated: String?
    let tempC, tempF, isDay: Int?
    let condition: Condition?
    let windMph, windKph: Double?
    let windDegree: Int?
    @OptionallyDecodable var windDir: WindDir?
    let pressureMB: Int?
    let pressureIn: Double?
    let precipMm, precipIn, humidity, cloud: Int?
    let feelslikeC, feelslikeF: Double?
    let visKM, visMiles, uv: Int?
    let gustMph, gustKph: Double?

    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case uv
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
    }
}

// MARK: - Condition
struct Condition: Codable, Sendable {
    @OptionallyDecodable var text: WeatherText?
    @OptionallyDecodable var icon: Icon?
    let code: Int?
    
    enum CodingKeys: String, CodingKey {
        case text = "Text"
        case icon
        case code
    }
}

enum Icon: String, Codable, Sendable {
    case cdnWeatherapiCOMWeather64X64Day113PNG = "//cdn.weatherapi.com/weather/64x64/day/113.png"
    case cdnWeatherapiCOMWeather64X64Day116PNG = "//cdn.weatherapi.com/weather/64x64/day/116.png"
    case cdnWeatherapiCOMWeather64X64Day176PNG = "//cdn.weatherapi.com/weather/64x64/day/176.png"
    case cdnWeatherapiCOMWeather64X64Night113PNG = "//cdn.weatherapi.com/weather/64x64/night/113.png"
    case cdnWeatherapiCOMWeather64X64Night116PNG = "//cdn.weatherapi.com/weather/64x64/night/116.png"
    case cdnWeatherapiCOMWeather64X64Night176PNG = "//cdn.weatherapi.com/weather/64x64/night/176.png"
}

enum WeatherText: String, Codable, Sendable {
    case clear = "Clear"
    case partlyCloudy = "Partly cloudy"
    case patchyRainPossible = "Patchy rain possible"
    case sunny = "Sunny"
}

enum WindDir: String, Codable, Sendable {
    case e = "E"
    case ene = "ENE"
    case ese = "ESE"
    case n = "N"
    case ne = "NE"
    case nne = "NNE"
    case s = "S"
    case se = "SE"
    case sse = "SSE"
    case ssw = "SSW"
    case sw = "SW"
}

// MARK: - Forecast
struct Forecast: Codable, Sendable {
    let forecastday: [Forecastday]?
}

// MARK: - Forecastday
struct Forecastday: Codable, Sendable {
    let date: String?
    let dateEpoch: Int?
    let day: Day?
    let astro: Astro?
    let hour: [Hour]?

    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day, astro, hour
    }
}

// MARK: - Astro
struct Astro: Codable, Sendable {
    let sunrise, sunset, moonrise, moonset: String?
    let moonPhase, moonIllumination: String?
    let isMoonUp, isSunUp: Int?

    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
        case isMoonUp = "is_moon_up"
        case isSunUp = "is_sun_up"
    }
}

// MARK: - Day
struct Day: Codable, Sendable {
    let maxtempC, maxtempF, mintempC, mintempF: Double?
    let avgtempC, avgtempF, maxwindMph, maxwindKph: Double?
    let totalprecipMm, totalprecipIn: Double?
    let totalsnowCM: Int?
    let avgvisKM: Double?
    let avgvisMiles, avghumidity, dailyWillItRain, dailyChanceOfRain: Int?
    let dailyWillItSnow, dailyChanceOfSnow: Int?
    let condition: Condition?
    let uv: Int?

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        case mintempF = "mintemp_f"
        case avgtempC = "avgtemp_c"
        case avgtempF = "avgtemp_f"
        case maxwindMph = "maxwind_mph"
        case maxwindKph = "maxwind_kph"
        case totalprecipMm = "totalprecip_mm"
        case totalprecipIn = "totalprecip_in"
        case totalsnowCM = "totalsnow_cm"
        case avgvisKM = "avgvis_km"
        case avgvisMiles = "avgvis_miles"
        case avghumidity
        case dailyWillItRain = "daily_will_it_rain"
        case dailyChanceOfRain = "daily_chance_of_rain"
        case dailyWillItSnow = "daily_will_it_snow"
        case dailyChanceOfSnow = "daily_chance_of_snow"
        case condition, uv
    }
}

// MARK: - Hour
struct Hour: Codable, Sendable {
    let timeEpoch: Int?
    let time: String?
    let tempC, tempF: Double?
    let isDay: Int?
    let condition: Condition?
    let windMph, windKph: Double?
    let windDegree: Int?
    @OptionallyDecodable var windDir: WindDir?
    let pressureMB: Int?
    let pressureIn, precipMm, precipIn: Double?
    let humidity, cloud: Int?
    let feelslikeC, feelslikeF, windchillC, windchillF: Double?
    let heatindexC, heatindexF, dewpointC, dewpointF: Double?
    let willItRain, chanceOfRain, willItSnow, chanceOfSnow: Int?
    let visKM: Double?
    let visMiles: Int?
    let gustMph, gustKph: Double?
    let uv: Int?

    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case willItRain = "will_it_rain"
        case chanceOfRain = "chance_of_rain"
        case willItSnow = "will_it_snow"
        case chanceOfSnow = "chance_of_snow"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
        case uv
    }
}

// MARK: - Location
struct Location: Codable, Sendable {
    let name, region, country: String?
    let lat, lon: Double?
    let tzID: String?
    let localtimeEpoch: Int?
    let localtime: String?

    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}