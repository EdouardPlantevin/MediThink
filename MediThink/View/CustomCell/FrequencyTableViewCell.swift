//
//  FrequencyTableViewCell.swift
//  MediThink
//
//  Created by Edouard PLANTEVIN on 01/04/2020.
//  Copyright © 2020 Edouard PLANTEVIN. All rights reserved.
//

import UIKit

class FrequencyTableViewCell: UITableViewCell {
    
    lazy var backView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 50))
        return view
    }()
    
    lazy var lbl: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 60, y: 10, width: self.frame.width - 80, height: 30))
        return lbl
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(backView) 
        backView.addSubview(lbl)
    }

}
