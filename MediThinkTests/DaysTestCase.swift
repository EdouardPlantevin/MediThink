//
//  DaysTestCase.swift
//  MediThinkTests
//
//  Created by Edouard PLANTEVIN on 04/04/2020.
//  Copyright © 2020 Edouard PLANTEVIN. All rights reserved.
//

import XCTest
@testable import MediThink

class DaysTestCase: XCTestCase {

    
    func testDay_WhenCallFuncDaySelectedMon_ThenShoulReturnActiveDayMon() {
        //Given
        let day = Days()
        
        //When
        day.daySelected(day: "Mon")
        
        //Then
        XCTAssertEqual(day.activeDay, .mon)
    }
    
    func testDay_WhenCallFuncDaySelectedTue_ThenShoulReturnActiveDayTue() {
        //Given
        let day = Days()
        
        //When
        day.daySelected(day: "Tue")
        
        //Then
        XCTAssertEqual(day.activeDay, .tue)
    }
    
    func testDay_WhenCallFuncDaySelectedWed_ThenShoulReturnActiveDayWed() {
        //Given
        let day = Days()
        
        //When
        day.daySelected(day: "Wed")
        
        //Then
        XCTAssertEqual(day.activeDay, .wed)
    }
    
    func testDay_WhenCallFuncDaySelectedThu_ThenShoulReturnActiveDayThu() {
        //Given
        let day = Days()
        
        //When
        day.daySelected(day: "Thu")
        
        //Then
        XCTAssertEqual(day.activeDay, .thu)
    }
    
    func testDay_WhenCallFuncDaySelectedFri_ThenShoulReturnActiveDayFri() {
        //Given
        let day = Days()
        
        //When
        day.daySelected(day: "Fri")
        
        //Then
        XCTAssertEqual(day.activeDay, .fri)
    }
    
    func testDay_WhenCallFuncDaySelectedSat_ThenShoulReturnActiveDaySat() {
        //Given
        let day = Days()
        
        //When
        day.daySelected(day: "Sat")
        
        //Then
        XCTAssertEqual(day.activeDay, .sat)
    }
    
    func testDay_WhenCallFuncDaySelectedSun_ThenShoulReturnActiveDaySun() {
        //Given
        let day = Days()
        
        //When
        day.daySelected(day: "Sun")
        
        //Then
        XCTAssertEqual(day.activeDay, .sun)
    }
    
    func testDay_WhenCallFuncDaySelectedWrong_ThenShoulReturnActiveDayMon() {
        //Given
        let day = Days()
        
        //When
        day.daySelected(day: "Wrong")
        
        //Then
        XCTAssertEqual(day.activeDay, .mon)
    }
    
    func testDayFuncTranslateDay_WhenGiveDays_ThenShoulReturnFullNameDay() {
        
        //Given
        let monday = Days.translateDay("Mon")
        let tuesday = Days.translateDay("Tue")
        let wednesday = Days.translateDay("Wed")
        let thursday = Days.translateDay("Thu")
        let friday = Days.translateDay("Fri")
        let saturday = Days.translateDay("Sat")
        let sunday = Days.translateDay("Sun")
        let wrong = Days.translateDay("Wrong")
        
        //Then
        XCTAssertEqual(monday, "Monday")
        XCTAssertEqual(tuesday, "Tuesday")
        XCTAssertEqual(wednesday, "Wednesday")
        XCTAssertEqual(thursday, "Thursday")
        XCTAssertEqual(friday, "Friday")
        XCTAssertEqual(saturday, "Saturday")
        XCTAssertEqual(sunday, "Sunday")
        XCTAssertEqual(wrong, "Monday")
    }


}
