//
//  DetailSeniorEstablishmentViewController.swift
//  MediThink
//
//  Created by Edouard PLANTEVIN on 02/04/2020.
//  Copyright © 2020 Edouard PLANTEVIN. All rights reserved.
//

import UIKit

class DetailSeniorEstablishmentViewController: UIViewController {
    
    
    /*  Outlet  */
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var townLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    
    
    var selectedEstablishment: SeniorEstablishment!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPage()
    }
    
    /*   Function   */
    
    private func setupPage() {
        titleLabel.text = selectedEstablishment.name
        townLabel.text = selectedEstablishment.town
        zipLabel.text = selectedEstablishment.zip
        phoneLabel.text = selectedEstablishment.phone
    }
    

    /*   Button   */
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}


