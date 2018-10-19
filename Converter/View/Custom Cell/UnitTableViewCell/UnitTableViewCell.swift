//
//  UnitTableViewCell.swift
//  Converter
//
//  Created by Alan on 10/18/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import UIKit

class UnitTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backspaceButton: UIButton!
    
    @IBOutlet weak var buttonLayer: UIButton!
    
    @IBOutlet weak var UnitLabel: UILabel!
    
    @IBOutlet weak var NumberLabel: UILabel!
    
    @IBAction func numberButtoned(_ sender: UIButton) {
        
    }
    
    @IBAction func operationButtoned(_ sender: UIButton) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backspaceButton.setImage(UIImage(named: "backspace"), for:  .normal)
        backspaceButton.imageView?.contentMode = .scaleAspectFit
        backspaceButton.setTitleColor(.black, for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
