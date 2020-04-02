//
//  HomeViewController.swift
//  MediThink
//
//  Created by Edouard PLANTEVIN on 30/03/2020.
//  Copyright © 2020 Edouard PLANTEVIN. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let dateService = DateSevice()
    let days = Days()
    var arrayOfMedicationOfDay: [MedicationDataModel] = []
    
    //OUTLET
    @IBOutlet var arrayNumberOutlet: [UIButton]!
    @IBOutlet var arrayLabelDayOutlet: [UILabel]!
    @IBOutlet weak var currentDayLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    

    override func viewWillAppear(_ animated: Bool) {
        setupDate()
        arrayOfMedicationOfDay = MedicationDataModel.getMedicationOfCurrentDay(currentDay: dateService.weekDay.first ?? "mon")
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateService.getWeek()
        //arrayOfMedicationOfDay = MedicationDataModel.getMedicationOfCurrentDay(currentDay: dateService.weekDay.first ?? "mon")
        tableView.reloadData()
    }
    
    //Function
    
    // setup week in top of the screen, day + number
    func setupDate() {
        var index = 0
        for outletButton in arrayNumberOutlet {
            outletButton.setTitle(dateService.dayNumber[index], for: .normal)
            outletButton.accessibilityLabel = dateService.weekDay[index]
            index += 1
        }
       
        for outletLabelDay in arrayLabelDayOutlet {
            if let indexLabel = Int(outletLabelDay.accessibilityIdentifier ?? "") {
                for currentOutletLabelDay in arrayLabelDayOutlet {
                    if Int(currentOutletLabelDay.accessibilityIdentifier ?? "") == indexLabel {
                        currentOutletLabelDay.text = dateService.weekDay[indexLabel]
                    }
                }
            }
        }
        days.daySelected(day: arrayNumberOutlet[0].accessibilityLabel ?? "Mon")
        currentDayLabel.text = dateService.completeCurrentDay
    }
    
    //Button
    @IBAction func numberDayBtn(_ sender: UIButton) {
        tableView.reloadData()
        setBackgroundButton()
        sender.backgroundColor = UIColor(red:0.00, green:0.69, blue:0.81, alpha:1.00)
        if let dayClic = sender.accessibilityLabel {
            print(dayClic)
            arrayOfMedicationOfDay = MedicationDataModel.getMedicationOfCurrentDay(currentDay: dayClic)
            days.daySelected(day: dayClic)
            tableView.reloadData()
        }
    }
    
    //Function
    
    func setBackgroundButton() {
        for button in arrayNumberOutlet {
            button.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        }
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfMedicationOfDay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        
        guard let name = arrayOfMedicationOfDay[indexPath.row].name else {
            return UITableViewCell()
        }
        guard let hour = arrayOfMedicationOfDay[indexPath.row].hourTake else {
            return UITableViewCell()
        }
        
        cell.configure(name: name, hour: hour)
        return cell
    
    }
}
