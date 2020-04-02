//
//  AddMedicationViewController.swift
//  MediThink
//
//  Created by Edouard PLANTEVIN on 01/04/2020.
//  Copyright © 2020 Edouard PLANTEVIN. All rights reserved.
//

import UIKit

class AddMedicationViewController: UIViewController {
    
    var settingArray = ["Every Day", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    var transparentView = UIView()
    var tableView = UITableView()
    
    //Var use for create Medication
    var daysTakeMedication = ""
    var isEveryDay: Bool = false
    
    let height: CGFloat = 300
    
    
    //Outlet
    @IBOutlet weak var NameMedicationTextField: UITextField!
    @IBOutlet weak var dayMedicationLabel: UITextView!
    @IBOutlet weak var hourTextField: UITextField!
    @IBOutlet weak var minuteTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isScrollEnabled = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FrequencyTableViewCell.self, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
    }
    

    @IBAction func addFrequencyBtn(_ sender: UIButton) {
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

    
    @objc func onClickTransparentView() {
        let screenSize = UIScreen.main.bounds.size
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0
            self.tableView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.height)
        }, completion: nil)
        transparentView.alpha = 0
    }
    
    @IBAction func addNewMedicationBtn(_ sender: UIButton) {
        //Name
        guard let name = NameMedicationTextField.text, name != "" else {
            //Show alert : No name
            print("No name")
            return
        }
        //Days
        if daysTakeMedication != "" || isEveryDay == true {
           
            //Hour
            guard let hour = hourTextField.text, hour.isInt == true else {
                //Show Alert : No hour
                print("No Hour")
                return
            }
            
            //No more 24hour and no less than 0
            guard let hourInt = Int(hour), hourInt <= 24, hourInt >= 0 else {
                //Show alert : Should be lass than 24, or more than 0
                print("Wrong hour")
                return
            }
            
            //Minute
            guard let minute = minuteTextField.text, minute.isInt == true else {
                //Show Alert : No Minute
                print("no minute")
                return
            }
            
            //No more 60 minute and no less than 0
            guard let minuteInt = Int(minute), minuteInt <= 60, minuteInt >= 0 else {
                //Show alert : Should be less than 60 or more than 0
                print("Wrong minute")
                return
            }
            print("Success")
            MedicationDataModel.addMedication(name: name, days: daysTakeMedication, hour: "\(hour)h\(minute)", isEveryDay: isEveryDay)
            navigationController?.popViewController(animated: true)
        } else {
            //Show alert : no days
            print("No days")
        }
    }

    
    

}


extension AddMedicationViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? FrequencyTableViewCell else { fatalError("Unable to deque cell")}
        cell.lbl.text = settingArray[indexPath.row]
        cell.backgroundColor = UIColor.systemTeal
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let daySelected = settingArray[indexPath.row]
        if daySelected == "Every Day" {
            if isEveryDay {
                //remove every day
                isEveryDay(false)
            } else {
                //add every day
                isEveryDay(true)
            }
        } else {
            if daysTakeMedication.contains("Every Day") {
                isEveryDay(false)
            }
            if daysTakeMedication.contains(daySelected.prefix(3)) {
                //Remove day
                clickOnDay(add: false, day: daySelected)
            } else {
                //Add day
                clickOnDay(add: true, day: daySelected)
            }
        }
       onClickTransparentView()
    }
    
    
    private func isEveryDay(_ isEveryDay: Bool) {
        if isEveryDay {
            daysTakeMedication = ""
            dayMedicationLabel.text = "Every Day"
            self.isEveryDay = true
        } else {
            print("IsEveryDay")
            daysTakeMedication = ""
            dayMedicationLabel.text = ""
            self.isEveryDay = false
        }
    }
    
    private func clickOnDay(add: Bool, day: String) {
        if isEveryDay == true {
            isEveryDay(false)
        }
        if add {
            // Add
            daysTakeMedication += "\(day.prefix(3)) "
            dayMedicationLabel.text += "\(day)\n"
        } else {
            // Remove
            daysTakeMedication = daysTakeMedication.replacingOccurrences(of: day.prefix(3), with: "")
            dayMedicationLabel.text = dayMedicationLabel.text.replacingOccurrences(of: "\(day)\n", with: "")
        }
        
    }
        
}
