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
    
    /*   Outlet   */
    @IBOutlet var arrayNumberOutlet: [UIButton]!
    @IBOutlet var arrayLabelDayOutlet: [UILabel]!
    @IBOutlet weak var currentDayLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    

    override func viewWillAppear(_ animated: Bool) {
        setupDate()
        days.fillArrayOfMedicationOfDay(day: dateService.weekDay.first ?? "Mon")
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateService.getWeek()
    }
    
    
    /*    Button    */
    @IBAction func numberDayBtn(_ sender: UIButton) {
        setBackgroundButton()
        sender.backgroundColor = UIColor(red:0.00, green:0.69, blue:0.81, alpha:1.00)
        if let dayClic = sender.accessibilityLabel {
            days.fillArrayOfMedicationOfDay(day: dayClic)
            days.daySelected(day: dayClic)
            tableView.reloadData()
        }
    }
    
    /*   Function   */
    
    // setup week in top of the screen, day + number
    private func setupDate() {
        
        var index = 0
        //Number
        for outletButton in arrayNumberOutlet {
            outletButton.setTitle(dateService.dayNumber[index], for: .normal)
            outletButton.accessibilityLabel = dateService.weekDay[index]
            index += 1
        }
        //Day
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
    
    //Transparent all number button
    private func setBackgroundButton() {
        for button in arrayNumberOutlet {
            button.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        }
    }

}

/*   Extention for tableView    */
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.arrayOfMedicationOfDay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        guard let name = days.arrayOfMedicationOfDay[indexPath.row].name else {
            return UITableViewCell()
        }
        guard let hour = days.arrayOfMedicationOfDay[indexPath.row].hourTake else {
            return UITableViewCell()
        }
        let taken = days.arrayOfMedicationOfDay[indexPath.row].taken
        let quantity = days.arrayOfMedicationOfDay[indexPath.row].quantity ?? "1"
        
        cell.configure(name: name, hour: hour, taken: taken, quantity: quantity)
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        MedicationDataModel.takenMedication(medication: days.arrayOfMedicationOfDay[indexPath.row])
        tableView.reloadData()
     }

}
