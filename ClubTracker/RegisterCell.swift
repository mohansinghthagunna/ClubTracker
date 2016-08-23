//
//  RegisterCell.swift
//  ClubTracker
//
//  Created by Mohan Singh Thagunna on 8/20/16.
//  Copyright © 2016 CreatuDevelopers. All rights reserved.
//

import UIKit

class RegisterCell: UITableViewCell {
//MARK: -- Outlets
    
    @IBOutlet weak var btnLate: UIButton!
    @IBOutlet weak var btnAbs: UIButton!
    @IBOutlet weak var btnIn: UIButton!
    @IBOutlet weak var lblName: UILabel!
    //MARK:--tableViewcell property
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
