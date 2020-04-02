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
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if zipTextField.text?.count == 2 {
            if let zipString = zipTextField.text, zipString.isInt == true {
                senior.getSeniorEstablishment(city: zipString) { (success) in
                    if success {
                        self.tableView.reloadData()
                        print("Success")
                    } else {
                        print("error")
                    }
                }
            }
        }
    }
    
    let senior = SeniorEstablishmentService(session: URLSession(configuration: .default))

    override func viewDidLoad() {
        zipTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for: .editingChanged)
        super.viewDidLoad()
    }

}

extension SeniorEstablishmentViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return senior.arrayOfSeniorEstablishment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SeniorCell", for: indexPath) as? SeniorTableViewCell else {
            return UITableViewCell()
        }
        
        let name = senior.arrayOfSeniorEstablishment[indexPath.row].name
        let town = senior.arrayOfSeniorEstablishment[indexPath.row].town
        
        cell.configure(name: name, town: town)
        
        // Transparent color when selected cell
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.black.withAlphaComponent(0)
        cell.selectedBackgroundView = bgColorView
        
        return cell
    
    }
    
    
}
