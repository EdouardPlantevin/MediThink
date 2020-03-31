//
//  Date.swift
//  MediThink
//
//  Created by Edouard PLANTEVIN on 30/03/2020.
//  Copyright © 2020 Edouard PLANTEVIN. All rights reserved.
//

import Foundation


class DateSevice {
    
    
    //We use two array for right order
    var weekDay: [String] = []
    var dayNumber: [String] = []
    
    // Use for get Array of current Week
    func getWeek() {
        var nomberOfDay = 0
        while nomberOfDay < 7 {
            var dayComponent    = DateComponents()
            dayComponent.day    = nomberOfDay
            let theCalendar     = Calendar.current
            let nextDate        = theCalendar.date(byAdding: dayComponent, to: Date())
            if let nextDate = nextDate {
                let formatterNumber = DateFormatter()
                formatterNumber.dateFormat = "dd"
                let dayNumberString = formatterNumber.string(from: nextDate)
                let formatterDay = DateFormatter()
                formatterDay.dateFormat = "EEEE"
                let dateDay = formatterDay.string(from: nextDate)
                let prefixDateDay = String(dateDay.prefix(3))

                weekDay.append(prefixDateDay)
                dayNumber.append(dayNumberString)
            }
            nomberOfDay += 1
        }
    }    
    
}
