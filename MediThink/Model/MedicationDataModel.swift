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
    
    static var all: [MedicationDataModel] {
        let request: NSFetchRequest<MedicationDataModel> = MedicationDataModel.fetchRequest()
        guard let medications = try? AppDelegate.viewContext.fetch(request) else { return [] }
        return medications
    }
    
    static func addMedication() {
        let medicationToAdd = MedicationDataModel(context: AppDelegate.viewContext)
        
        medicationToAdd.name = "Doliprane"
        medicationToAdd.days = "mon fri"

        try? AppDelegate.viewContext.save()
    }
    
}
