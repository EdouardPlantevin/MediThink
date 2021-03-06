//
//  AddMedicationViewController.swift
//  MediThink
//
//  Created by Edouard PLANTEVIN on 01/04/2020.
//  Copyright © 2020 Edouard PLANTEVIN. All rights reserved.
//

import UIKit

class AddMedicationViewController: UIViewController {
    
    //Use for create list of day
    var transparentView = UIView()
    var tableView = UITableView()
    let height: CGFloat = 300
    
    //Var use for create Medication
    var daysTakeMedication: [String] = []
    var isEveryDay: Bool = false
    
   
    
    
    //Outlet
    @IBOutlet weak var nameMedicationTextField: UITextField!
    @IBOutlet weak var dayMedicationLabel: UITextView!
    @IBOutlet weak var hourTextField: UITextField!
    @IBOutlet weak var minuteTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Usefull with textFieldExtention, hide keyboard when return
        nameMedicationTextField.delegate = self
        
        // Usefull for create DaysTableView
        tableView.isScrollEnabled = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FrequencyTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    
    
    /*   Button   */
    
    // Tap Gesture recognizer
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        dismissAllKeybaord()
    }
    
    
    @IBAction func plusBtn(_ sender: UIButton) {
        if let labelTextField = quantityTextField.text {
            if var intQuantity = Int(labelTextField) {
                intQuantity += 1
                quantityTextField.text = String(intQuantity)
            }
            if labelTextField == "1/2" {
                quantityTextField.text = "1"
            }
        }
    }
    
    @IBAction func minusBtn(_ sender: UIButton) {
        if let labelTextField = quantityTextField.text {
            if var intQuantity = Int(labelTextField) {
                if intQuantity > 1 {
                    intQuantity -= 1
                    quantityTextField.text = String(intQuantity)
                }
                if intQuantity == 1 {
                    quantityTextField.text = "1/2"
                }
            }
        }
    }
    
    
    
    
    
    // Create and appear list of day + every day
    @IBAction func addFrequencyBtn(_ sender: UIButton) {
        dismissAllKeybaord()
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9) //Transparent dark
        transparentView.frame = self.view.frame
        //Add transparentView to currentView
        self.view.addSubview(transparentView)
        
        let screenSize = UIScreen.main.bounds.size
        tableView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: height)
        tableView.backgroundColor = UIColor.black
        
        self.view.addSubview(tableView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClickTransparentView))
        transparentView.addGestureRecognizer(tapGesture)
        
        transparentView.alpha = 0
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
            self.transparentView.alpha = 0.5
            self.tableView.frame = CGRect(x: 0, y: screenSize.height - self.height, width: screenSize.width, height: self.height)
        }, completion: nil)
        
    }

    // dismiss list of day
    @objc func onClickTransparentView() {
        let screenSize = UIScreen.main.bounds.size
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0
            self.tableView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.height)
        }, completion: nil)
        transparentView.alpha = 0
    }
    
    
    //Button to add new Medication
    @IBAction func addNewMedicationBtn(_ sender: UIButton) {
        //Name
        guard let name = nameMedicationTextField.text, name != "" else {
            //Show alert : No name
            presentAlert(view: self, message: "You don't put medication")
            return
        }
        //Days
        if daysTakeMedication.count > 0 {
           
            //Hour
            guard let hour = hourTextField.text, hour.isInt == true else {
                //Show Alert : No hour
                presentAlert(view: self, message: "You have to put hour")
                return
            }
            
            //No more 24hour and no less than 0
            guard let hourInt = Int(hour), hourInt <= 24, hourInt >= 0 else {
                //Show alert : Should be lass than 24, or more than 0
                presentAlert(view: self, message: "You have to put right hour")
                return
            }
            
            //Minute
            guard let minute = minuteTextField.text, minute.isInt == true else {
                //Show Alert : No Minute
                presentAlert(view: self, message: "You don't put minute")
                return
            }
            
            //No more 60 minute and no less than 0
            guard let minuteInt = Int(minute), minuteInt <= 59, minuteInt >= 0 else {
                //Show alert : Should be less than 60 or more than 0
                presentAlert(view: self, message: "You don't put right minute")
                return
            }
            
            //Get Quantity
            let quantity = quantityTextField.text ?? "1"
    
            for day in daysTakeMedication {
                MedicationDataModel.addMedication(name: name, days: String(day.prefix(3)), hour: "\(hour)h\(minute)", quantity: quantity)
            }
            navigationController?.popViewController(animated: true)
        } else {
            //Show alert : no days
            presentAlert(view: self, message: "Click on + to add day")
        }
    }
    
    
    
    /*    Function   */
    
    //Resign keyboard
    private func dismissAllKeybaord() {
        nameMedicationTextField.resignFirstResponder()
        hourTextField.resignFirstResponder()
        minuteTextField.resignFirstResponder()
    }
    
    //Condition to add new day
    private func isEveryDay(_ isEveryDay: Bool) {
        if isEveryDay {
            daysTakeMedication = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
            dayMedicationLabel.text = "Every Day"
            self.isEveryDay = true
        } else {
            daysTakeMedication.removeAll()
            dayMedicationLabel.text = ""
            self.isEveryDay = false
        }
    }
    
    // Add new day
    private func clickOnDay(add: Bool, day: String) {
        if isEveryDay == true {
            isEveryDay(false)
        }
        if add {
            // Add
            daysTakeMedication.append("\(day.prefix(3))")
            dayMedicationLabel.text += "\(day)\n"
        } else {
            // Remove
            if let index = daysTakeMedication.firstIndex(of: String(day.prefix(3))) {
                daysTakeMedication.remove(at: index)
            }
            dayMedicationLabel.text = dayMedicationLabel.text.replacingOccurrences(of: "\(day)\n", with: "")
        }
    }
    
    

}


extension AddMedicationViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DateSevice.arrayOfDay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? FrequencyTableViewCell else { fatalError("Unable to deque cell")}
        cell.lbl.text = DateSevice.arrayOfDay[indexPath.row]
        cell.backgroundColor = UIColor.systemTeal
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let daySelected = DateSevice.arrayOfDay[indexPath.row]
        if daySelected == "Every Day" {
            if isEveryDay {
                //remove every day
                isEveryDay(false)
            } else {
                //add every day
                isEveryDay(true)
            }
        } else {
            if isEveryDay {
                isEveryDay(false)
            }
            if daysTakeMedication.contains(String(daySelected.prefix(3))) {
                //Remove day
                clickOnDay(add: false, day: daySelected)
            } else {
                //Add day
                clickOnDay(add: true, day: daySelected)
            }
        }
       onClickTransparentView()
    }
}
