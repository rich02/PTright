//
//  InjuryDescTableViewCell.swift
//  PTRight
//
//  Created by MU IT Program on 12/2/15.
//  Copyright © 2015 James Tapia. All rights reserved.
//

import UIKit

class InjuryDescTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descriptionText: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
