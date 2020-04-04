//
//  GlobalFunction.swift
//  MediThink
//
//  Created by Edouard PLANTEVIN on 04/04/2020.
//  Copyright © 2020 Edouard PLANTEVIN. All rights reserved.
//

import Foundation
import UIKit

// Show Alert
func presentAlert(view: UIViewController, message: String) {
    let alertVC = UIAlertController(title: "Erreur", message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    alertVC.addAction(action)
    view.present(alertVC, animated: true, completion: nil)
}
