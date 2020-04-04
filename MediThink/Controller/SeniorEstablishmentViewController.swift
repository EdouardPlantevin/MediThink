//
//  SeniorEstablishmentViewController.swift
//  MediThink
//
//  Created by Edouard PLANTEVIN on 02/04/2020.
//  Copyright © 2020 Edouard PLANTEVIN. All rights reserved.
//

import UIKit

class SeniorEstablishmentViewController: UIViewController {
    
    
    
    /*    Outlet   */
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var zipTextField: UITextField!
    
    
    
    let senior = SeniorEstablishmentService(session: URLSession(configuration: .default))
    var selectedEstablishment: SeniorEstablishment!

    override func viewDidLoad() {
        zipTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for: .editingChanged)
        super.viewDidLoad()
        
    }
    
    //Send data to DetailEstablishmentViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToDetailEstablishment" {
            let detailVC = segue.destination as! DetailSeniorEstablishmentViewController
            detailVC.selectedEstablishment = selectedEstablishment
        }
    }
    
    
    /*     Button    */
    
    
    // Tap Gesture Recognizer
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        zipTextField.resignFirstResponder()
    }
    
    
    
    /*   Function   */
    
    //Check textfield + Call api gouv
    @objc func textFieldDidChange(_ textField: UITextField) {
        if zipTextField.text?.count == 2 {
            if let zipString = zipTextField.text, zipString.isInt == true {
                senior.getSeniorEstablishment(city: zipString) { (success) in
                    if success {
                        self.tableView.reloadData()
                    } else {
                        presentAlert(view: self, message: "Nothing found")
                    }
                }
            }
        }
        if zipTextField.text?.count ?? 0 > 2 {
            zipTextField.text = ""
        }
    }
    
    
    

}

extension SeniorEstablishmentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return senior.arrayOfSeniorEstablishment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SeniorCell", for: indexPath)
        
        let name = senior.arrayOfSeniorEstablishment[indexPath.row].name
        let town = senior.arrayOfSeniorEstablishment[indexPath.row].town
        
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = town
        
        return cell
    
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedEstablishment = senior.arrayOfSeniorEstablishment[indexPath.row]
        performSegue(withIdentifier: "segueToDetailEstablishment", sender: self)
    }
    
    
}
