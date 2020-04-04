//
//  MedicationDataModelTestCase.swift
//  MediThinkTests
//
//  Created by Edouard PLANTEVIN on 04/04/2020.
//  Copyright © 2020 Edouard PLANTEVIN. All rights reserved.
//

import XCTest
import CoreData
@testable import MediThink

class MedicationDataModelTestCase: XCTestCase {

    
      func testMedication_WhenCreateMedication_ThenShouldAddToCoreData() {
         
        let name = "token"
        let days = "Mon"
        let hour = "12h12"
        let quantity = "1"
        
        
        MedicationDataModel.addMedication(name: name, days: days, hour: hour, quantity: quantity)
        
        var existe: Bool = false
        let medications = MedicationDataModel.all
        
        for medication in medications {
            if medication.name == "token" {
                existe = true
            }
        }
        
        XCTAssertTrue(existe)
    
      }
    
      func testMedication_WhenMedicationIsTake_ThenShouldUpdateToCoreData() {

        //Given
        let name = "token"
        let days = "Mon"
        let hour = "12h12"
        let quantity = "1"
        MedicationDataModel.addMedication(name: name, days: days, hour: hour, quantity: quantity)
        
        let medications = MedicationDataModel.all
        for medication in medications {
            if medication.name == name {
                MedicationDataModel.takenMedication(medication: medication)
                
                XCTAssertTrue(medication.taken)
            }
        }
    
      }
    
    func testMedication_WhenCallGetMedicationOfCurrentDay_ThenShouldReturnArrayOfMedication() {
      //Given
      let name = "token"
      let days = "Mon"
      let hour = "12h12"
      let quantity = "1"
      MedicationDataModel.addMedication(name: name, days: days, hour: hour, quantity: quantity)
      
      let result = MedicationDataModel.getMedicationOfCurrentDay(currentDay: "Mon")
      
      let medicationName = result.first?.name
      
      XCTAssertEqual(medicationName, "token")

    }
    
      func testMedication_WhenRemoveMedication_ThenShouldRemoveToCoreData() {

        //Given
        let name = "token"
        let days = "Mon"
        let hour = "12h12"
        let quantity = "1"
        MedicationDataModel.addMedication(name: name, days: days, hour: hour, quantity: quantity)
        
        let medications = MedicationDataModel.all
        for medication in medications {
            MedicationDataModel.removeMedication(medication: medication)
        }
    
        XCTAssertEqual(MedicationDataModel.all.count, 0)
      }
}
