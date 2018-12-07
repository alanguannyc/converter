

import UIKit
import RealmSwift

extension CategoryViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.resignFirstResponder()

        
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        EntireItemList = EntireItemList?.filter("picked == false").filter("name contains[cd] %@", searchBar.text!).sorted(byKeyPath: "name", ascending: true)
//        tableView.reloadData()
//        if searchBar.text?.count == 0 {
//            loadItems()
//            tableView.reloadData()
//
//            
//        }
    }
    

    
}
