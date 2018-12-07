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
        
        let deleteAction = SwipeAction(style: .destructive, title: nil) { action, indexPath in
            
            
            self.updateModel(at: indexPath)
            action.fulfill(with: .delete)
            self.itemTableView.reloadData()
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
    func updateModel(at indexPath: IndexPath) {
        print(indexPath.row, requests,selectedCategory!.items)
        
        requests?.remove(at: indexPath.row)
        
        if let selectedItem = self.selectedCategory?.items[indexPath.row] {
            do{
                try realm.write {
                    print(indexPath.row)
                    selectedCategory!.items.filter("picked == true")[indexPath.row].picked = false
//                    requests = Array((selectedCategory?.items.filter("picked == true"))!)
                    //                        self.unitItems = self.selectedCategory?.items.filter("picked == true")
//                    print("deleted",  selectedCategory?.items[indexPath.row])
                    
                }
            } catch {
                print("Error deleting categories \(error)")
            }
            
            
        }
    }
}
