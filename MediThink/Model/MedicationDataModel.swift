//
//  MedicationDataModel.swift
//  MediThink
//
//  Created by Edouard PLANTEVIN on 31/03/2020.
//  Copyright © 2020 Edouard PLANTEVIN. All rights reserved.
//

import Foundation
import CoreData

class MedicationDataModel: NSManagedObject {
    
    
    //Get all Medication
    static var all: [MedicationDataModel] {
        let request: NSFetchRequest<MedicationDataModel> = MedicationDataModel.fetchRequest()
        guard let medications = try? AppDelegate.viewContext.fetch(request) else { return [] }
        return medications
    }
    
    //Get only medication on active day
    static func getMedicationOfCurrentDay(currentDay: String) -> [MedicationDataModel] {
        var arrayMedicationsOfDay: [MedicationDataModel] = []
        for medication in all {
            if let medicationDay = medication.days {
                print(medicationDay)
                print(currentDay)
                if medicationDay.contains(currentDay) {
                    arrayMedicationsOfDay.append(medication)
                }
            }
        }
        return arrayMedicationsOfDay
    }
    
    
    // Delete one Medication
    static func removeMedication(medication: MedicationDataModel) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MedicationDataModel")
        if let name = medication.name {
            fetchRequest.predicate = NSPredicate(format: "name = %@", name)
        }

        let profiles = try? AppDelegate.viewContext.fetch(fetchRequest)
        if let profiles = profiles {
            if let recipe = profiles.first as? MedicationDataModel {
                AppDelegate.viewContext.delete(recipe)
                try? AppDelegate.viewContext.save()
            }
        }
    }
    
    //Add new Medication to CoreData
    static func addMedication() {
        let medicationToAdd = MedicationDataModel(context: AppDelegate.viewContext)
        
        medicationToAdd.name = "Medicament Tue and Sat"
        medicationToAdd.days = "Tue Sat"

        try? AppDelegate.viewContext.save()
    }
    
}
