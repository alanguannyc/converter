//
//  UnitViewControllerSwipe.swift
//  Converter
//
//  Created by Alan on 11/5/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import Foundation
import SwipeCellKit

extension UnitViewController: SwipeTableViewCellDelegate {


    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            
            self.updateModel(at: indexPath)
//            tableView.reloadData()
            
        }
        
        deleteAction.image = UIImage(named: "Trash-Icon")
        
        return [deleteAction]
    }

    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        return options
    }

    // MARK: - Delete by swipe
    func updateModel(at indexPath: IndexPath) {
        if let selectedItem = self.selectedCategory?.items[indexPath.row] {
            do{
                try self.realm.write {
                    selectedItem.picked = false
                }
            } catch {
                print("Error deleting categories \(error)")
            }
        }
        
    }
}
