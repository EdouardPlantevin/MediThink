//
//  MedicationViewController.swift
//  MediThink
//
//  Created by Edouard PLANTEVIN on 31/03/2020.
//  Copyright © 2020 Edouard PLANTEVIN. All rights reserved.
//

import UIKit

class MedicationViewController: UIViewController {
    
    
    //Outlet
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
}



extension MedicationViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let drugToDelete = MedicationDataModel.all[indexPath.row]
            MedicationDataModel.removeMedication(medication: drugToDelete)
            tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MedicationDataModel.all.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationCell", for: indexPath) as? MedicationTableViewCell else {
            return UITableViewCell()
        }
        
        guard let name = MedicationDataModel.all[indexPath.row].name else {
            return UITableViewCell()
        }
        guard let hour = MedicationDataModel.all[indexPath.row].hourTake else {
            return UITableViewCell()
        }
        
        cell.configure(name: name, hour: hour)
        return cell
    
    }
}
