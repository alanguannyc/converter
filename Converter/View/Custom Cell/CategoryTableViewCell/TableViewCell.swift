//
//  TableViewCell.swift
//  Converter
//
//  Created by Alan on 10/12/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cellBackground: UIView!
    
    
    @IBOutlet weak var cellLabel: UILabel!
    
    @IBOutlet weak var cellImage: UIImageView!
    
    var customBackgroundColor : UIColor?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        cellBackground.backgroundColor = customBackgroundColor
        // Configure the view for the selected state
    }
    
}
