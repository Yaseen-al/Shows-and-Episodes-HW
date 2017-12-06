//
//  CustomShowTableViewCell.swift
//  Shows and Episodes HW
//
//  Created by C4Q on 12/6/17.
//  Copyright © 2017 Quark. All rights reserved.
//

import UIKit

class CustomShowTableViewCell: UITableViewCell {

    @IBOutlet weak var showPoster: UIImageView!
    @IBOutlet weak var showName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
