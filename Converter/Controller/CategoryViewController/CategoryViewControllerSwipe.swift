//
//  UnitViewControllerSwipe.swift
//  Converter
//
//  Created by Alan on 11/5/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import Foundation
import SwipeCellKit

extension CategoryViewController: SwipeTableViewCellDelegate {


    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: nil) { action, indexPath in

            self.updateCategory(at: indexPath)
            action.fulfill(with: .delete)
            self.categoryTableView.reloadData()
        }
        
        deleteAction.image = UIImage(named: "Trash-Icon")
//        itemTableView.deleteRows(at: [indexPath], with: .fade)  
        return [deleteAction]
    }

    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        

        return options
    }

    // MARK: - Delete by swipe
    func updateCategory(at indexPath: IndexPath) {
        
        
        requests?.remove(at: indexPath.row)
        
        try! realm.write {
            categories?.filter("picked == true")[indexPath.row].picked = false
        }
    }
}
