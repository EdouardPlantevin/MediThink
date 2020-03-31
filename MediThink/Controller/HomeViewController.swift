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
    
    
    enum currentDay {
        case monday
        case sunday
    }
    var activeDay: currentDay = .monday
    
    //OUTLET
    @IBOutlet var arrayNumberOutlet: [UIButton]!
    @IBOutlet var arrayLabelDayOutlet: [UILabel]!
    @IBOutlet weak var currentDayLabel: UILabel!
    

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
    }
    
    //Button
    @IBAction func numberDayBtn(_ sender: UIButton) {
        setBackgroundButton()
        sender.backgroundColor = UIColor(red:0.00, green:0.69, blue:0.81, alpha:1.00)
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
        
        switch activeDay {
            case .monday:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationCell", for: indexPath)
            cell.textLabel?.text = "Test numéro 1"
            cell.detailTextLabel?.text = "Test numéro 1"
            return cell
            case .sunday:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MedicationCell", for: indexPath)
            cell.textLabel?.text = "Test numéro 2"
            cell.detailTextLabel?.text = "Test numéro 2"
            return cell
        }
    }

    
    
    
    
     
 }
