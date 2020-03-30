//
//  HomeViewController.swift
//  MediThink
//
//  Created by Edouard PLANTEVIN on 30/03/2020.
//  Copyright © 2020 Edouard PLANTEVIN. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //OUTLET
    @IBOutlet weak var mondayNumber: UIButton!
    @IBOutlet weak var tuesdayNumber: UIButton!
    @IBOutlet weak var wednesdayNumber: UIButton!
    @IBOutlet weak var thursdayNumber: UIButton!
    @IBOutlet weak var fridayNumber: UIButton!
    @IBOutlet weak var saturdayNumber: UIButton!
    @IBOutlet weak var sundayNumber: UIButton!
    
    @IBOutlet var arrayNumberOutlet: [UIButton]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Button
    @IBAction func numberDayBtn(_ sender: UIButton) {
        setBackgroundButton()
        sender.backgroundColor = UIColor(red:0.00, green:0.69, blue:0.81, alpha:1.00)
    }
    
    func setBackgroundButton() {
        for button in arrayNumberOutlet {
            button.backgroundColor = UIColor.white.withAlphaComponent(0.0)
        }
    }
    
    

}
