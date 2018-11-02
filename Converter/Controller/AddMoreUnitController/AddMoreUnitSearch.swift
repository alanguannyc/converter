

import UIKit
import RealmSwift

extension AddMoreUnitTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.resignFirstResponder()
//        EntireItemList = EntireItemList?.filter("name contains[cd] %@", searchBar.text!).sorted(byKeyPath: "name", ascending: true)
//        tableView.reloadData()
        
        
        //        let request : NSFetchRequest<Item> = Item.fetchRequest()
        //
        //        let searchPredicate = NSPredicate(format: "title contains[cd] %@", searchBar.text!)
        //
        //        request.predicate = predicate
        
        //        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        //
        //        loadItems(with: request, with: searchPredicate)
        
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        EntireItemList = EntireItemList?.filter("picked == false").filter("name contains[cd] %@", searchBar.text!).sorted(byKeyPath: "name", ascending: true)
        tableView.reloadData()
        if searchBar.text?.count == 0 {
            loadItems()
            tableView.reloadData()
            //            DispatchQueue.main.async {
            //                searchBar.resignFirstResponder()
            //            }
            
        }
    }
    
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        print("type")
//        EntireItemList = EntireItemList?.filter("name contains[cd] %@", searchBar.text!).sorted(byKeyPath: "name", ascending: true)
//        AddMoreUnitTableView.reloadData()
//    }
    
    
}
