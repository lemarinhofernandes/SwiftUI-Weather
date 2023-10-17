//
//  DateExtension.swift
//  SwiftUI-Weather
//
//  Created by Luís Eduardo Marinho Fernandes on 17/10/23.
//

import Foundation

extension Date {
    func dayOfWeek(_ day: String) -> Int? {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let dayDate = formatter.date(from: day) else { return nil }
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: dayDate)
        return weekDay
    }
}
