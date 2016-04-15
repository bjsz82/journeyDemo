//
//  SummaryTableViewCell.swift
//  journayDemo
//
//  Created by Wang Weihan on 4/14/16.
//  Copyright © 2016 Wang Weihan. All rights reserved.
//

import UIKit

class SummaryTableViewCell: UITableViewCell {

    @IBOutlet weak var summaryImage: UIImageView!
    
    @IBOutlet weak var imageTitle: UILabel!
    
    @IBOutlet weak var iamgeDescription: UILabel!
    
    @IBOutlet weak var dateImage: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
