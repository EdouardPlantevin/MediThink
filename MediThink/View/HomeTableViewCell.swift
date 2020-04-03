//
//  MedicationTableViewCell.swift
//  MediThink
//
//  Created by Edouard PLANTEVIN on 02/04/2020.
//  Copyright © 2020 Edouard PLANTEVIN. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    //Outlet HomePage
    @IBOutlet weak var nameMedicationLabel: UILabel!
    @IBOutlet weak var hourMedicationLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var imageTaken: UIImageView!
    
    //Outlet MedicationPage
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(name: String, hour: String, taken: Bool) {
        nameMedicationLabel.text = name
        hourMedicationLabel.text = hour
        if taken {
            imageTaken.image = UIImage(named: "taken")
        } else {
            imageTaken.image = UIImage(named: "noTaken")
        }
    }
    
    func setupView() {
        cellView.layer.borderWidth = 1
        cellView.layer.cornerRadius = 15
        cellView.layer.borderColor = UIColor.systemTeal.cgColor
    }
    
    

}
