//
//  ScaleSegue.swift
//  Converter
//
//  Created by Alan on 10/16/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import UIKit

class ScaleSegue: UIStoryboardSegue {

    override func perform() {
        scale()
    }
    
    func scale() {
        let toViewController = self.destination as! UnitViewController
        let fromViewController = self.source as! CategoryViewController
        
        let containerView = fromViewController.view
        let containerCerter = fromViewController.view.center
        
        let x : CGFloat = 133
        let y = toViewController.view.frame.size.width
        var selectedIndexPath = fromViewController.categoryTableView.indexPathForSelectedRow
        var selectedCell = fromViewController.categoryTableView.cellForRow(at: selectedIndexPath!) as! TableViewCell
        let center = selectedCell.contentView.center
        var cellCenterX = selectedCell.contentView.frame.origin.x + selectedCell.contentView.frame.width/2
        var cellCenterY = selectedCell.contentView.frame.origin.y + selectedCell.contentView.frame.height/2
        let width = selectedCell.contentView.frame.width
        print("cell\(selectedIndexPath)")
        print("cell\(selectedCell.center)")
        print("cell\(selectedCell.cellLabel.text)")
        print("cell center\(cellCenterX) and  \(cellCenterY)")
        toViewController.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        toViewController.view.center = selectedCell.center
        
        selectedCell.addSubview(toViewController.view)
        
        UIView.animate(withDuration: 0.5, animations: {
            toViewController.view.transform = CGAffineTransform.identity
        }) { (success) in
            fromViewController.present(toViewController, animated: false, completion: nil)
        }
    }
}

