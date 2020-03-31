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
    
    //OUTLET
    @IBOutlet var arrayNumberOutlet: [UIButton]!
    @IBOutlet var arrayLabelDayOutlet: [UILabel]!
    @IBOutlet weak var currentDayLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    

    override func viewWillAppear(_ animated: Bool) {
        setupDate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateService.getWeek()
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

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch days.activeDay {
            case .mon:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationCell", for: indexPath)
                cell.textLabel?.text = MedicationDataModel.all[indexPath.row].name
                cell.detailTextLabel?.text = "Monday"
                return cell
            case .tue:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationCell", for: indexPath)
                cell.textLabel?.text = "Tuesday"
                cell.detailTextLabel?.text = "Tuesday"
                return cell
            case .wed:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationCell", for: indexPath)
                cell.textLabel?.text = "Wednesday"
                cell.detailTextLabel?.text = "Wednesday"
                return cell
            case .thu:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationCell", for: indexPath)
                cell.textLabel?.text = "Thursday"
                cell.detailTextLabel?.text = "Thursday"
                return cell
            case .fri:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationCell", for: indexPath)
                cell.textLabel?.text = "Friday"
                cell.detailTextLabel?.text = "Friday"
                return cell
            case .sat:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationCell", for: indexPath)
                cell.textLabel?.text = "Saturday"
                cell.detailTextLabel?.text = "Saturday"
                return cell
            case .sun:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationCell", for: indexPath)
                cell.textLabel?.text = "Sunday"
                cell.detailTextLabel?.text = "Sunday"
                return cell
            
        }
    }

    
    
    
    
     
 }
