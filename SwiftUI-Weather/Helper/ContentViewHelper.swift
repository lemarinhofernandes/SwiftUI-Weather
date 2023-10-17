//
//  ContentViewHelper.swift
//  SwiftUI-Weather
//
//  Created by Luís Eduardo Marinho Fernandes on 17/10/23.
//

import Foundation

class ContentViewHelper {
    func isNight() -> Bool {
        let timeStamp = Date.now.description.split(separator: " ")[1].split(separator: ":").first ?? ""
        let hour = Int(timeStamp)
        guard let hour = hour else { return false }
        return hour >= 18 ? true : false
        
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
