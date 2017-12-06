//
//  CustomEpisodeTableViewCell.swift
//  Shows and Episodes HW
//
//  Created by C4Q on 12/6/17.
//  Copyright © 2017 Quark. All rights reserved.
//

import UIKit

class CustomEpisodeTableViewCell: UITableViewCell {

    @IBOutlet weak var EpisodePoster: UIImageView!
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var episodeSeason: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
