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
        let id = medication.objectID
        fetchRequest.predicate = NSPredicate(format: "self == %@", id)
        

        let profiles = try? AppDelegate.viewContext.fetch(fetchRequest)
        if let profiles = profiles {
            if let medication = profiles.first as? MedicationDataModel {
                AppDelegate.viewContext.delete(medication)
                try? AppDelegate.viewContext.save()
            }
        }
    }
    
    //Swith taken Medication
    static func takenMedication(medication: MedicationDataModel) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MedicationDataModel")
        let id = medication.objectID
        fetchRequest.predicate = NSPredicate(format: "self == %@", id)
        

        let profiles = try? AppDelegate.viewContext.fetch(fetchRequest)
        if let profiles = profiles {
            if let medication = profiles.first as? MedicationDataModel {
                medication.setValue(!medication.taken, forKey: "taken")
                try? AppDelegate.viewContext.save()
            }
        }
    }
    
    //Add new Medication to CoreData
    static func addMedication(name: String, days: String, hour: String, quantity: String) {
        let medicationToAdd = MedicationDataModel(context: AppDelegate.viewContext)
        
        medicationToAdd.name = name
        medicationToAdd.days = days
        medicationToAdd.hourTake = hour
        medicationToAdd.taken = false
        medicationToAdd.quantity = quantity
        try? AppDelegate.viewContext.save()
    }
    
}
