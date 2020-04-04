//
//  Days.swift
//  MediThink
//
//  Created by Edouard PLANTEVIN on 31/03/2020.
//  Copyright © 2020 Edouard PLANTEVIN. All rights reserved.
//

import Foundation

enum currentDay {
    case mon, tue, wed, thu, fri, sat, sun
}

class Days {
    
    var activeDay: currentDay = .mon
    var arrayOfMedicationOfDay: [MedicationDataModel] = []
    
    func fillArrayOfMedicationOfDay(day: String) {
        arrayOfMedicationOfDay = MedicationDataModel.getMedicationOfCurrentDay(currentDay: day)
    }
    
    func daySelected(day: String) {
        switch day {
        case "Mon":
            activeDay = .mon
        case "Tue":
            activeDay = .tue
        case "Wed":
            activeDay = .wed
        case "Thu":
            activeDay = .thu
        case "Fri":
            activeDay = .fri
        case "Sat":
            activeDay = .sat
        case "Sun":
            activeDay = .sun
        default:
            activeDay = .mon
        }
    }
    
    static func translateDay(_ day: String) -> String {
        switch day {
        case "Mon":
            return "Monday"
        case "Tue":
            return "Tuesday"
        case "Wed":
            return "Wednesday"
        case "Thu":
            return "Thursday"
        case "Fri":
            return "Friday"
        case "Sat":
            return "Saturday"
        case "Sun":
            return "Sunday"
        default:
            return "Monday"
        }
    }
    
}
