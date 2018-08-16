//
//  TableViewCell.swift
//  LearningRealm
//
//  Created by Ada 2018 on 14/08/2018.
//  Copyright © 2018 Academy. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet var imageContact: UIImageView!
    @IBOutlet var nameContact: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
