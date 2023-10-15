//
//  WeatherProvider.swift
//  SwiftUI-Weather
//
//  Created by Luís Eduardo Marinho Fernandes on 15/10/23.
//

import Foundation

public enum WeekDays: String, CaseIterable {
    case monday = "MON"
    case tuesday = "TUE"
    case wednsday = "WED"
    case thursday = "THU"
    case friday = "FRI"
    case saturday = "SAT"
    case sunday = "SUN"
}

public struct Weather: Hashable {
    var day: WeekDays
    var image: String
    var degrees: String
}

public class WeatherProvider {
    static let components: [Weather] = [Weather(day: .tuesday, image: "cloud.sun.fill", degrees: "74°"),
                                         Weather(day: .wednsday, image: "sun.max.fill", degrees: "70°"),
                                         Weather(day: .thursday, image: "wind", degrees: "66°"),
                                         Weather(day: .friday, image: "sunset.fill", degrees: "69°"),
                                         Weather(day: .saturday, image: "moon.stars.fill", degrees: "55°")]
}
