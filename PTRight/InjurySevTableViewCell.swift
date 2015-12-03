//
//  InjurySevTableViewCell.swift
//  PTRight
//
//  Created by MU IT Program on 12/2/15.
//  Copyright © 2015 James Tapia. All rights reserved.
//

import UIKit

class InjurySevTableViewCell: UITableViewCell {
    
    @IBOutlet weak var severityLabel: UILabel!
    @IBOutlet weak var sevSlider: UISlider!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
