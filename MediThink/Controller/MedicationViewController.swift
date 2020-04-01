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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // Button
    @IBAction func addMedication(_ sender: Any) {
        
    }
    
}



extension MedicationViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MedicationDataModel.all.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationCell", for: indexPath)
        cell.textLabel?.text = MedicationDataModel.all[indexPath.row].name
        cell.detailTextLabel?.text = MedicationDataModel.all[indexPath.row].name
        return cell
    
    }
}
