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
    
}
