//
//  AddMoreUnitTableViewController.swift
//  Converter
//
//  Created by Alan on 10/30/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import UIKit
import RealmSwift

protocol reloadOriginalDataTable {
    func reloadTable()
}

class AddMoreUnitTableViewController: UITableViewController {
    var reloadDataDelegate : reloadOriginalDataTable?
    static let main = UnitViewController()
    var EntireItemList : Results<UnitItem>?
    var categoryName : UnitCategory? {
        didSet{
            loadItems()
        }
    }
    let realm = try! Realm()
    @IBOutlet weak var AddMoreSearchBar: UISearchBar!
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = categoryName?.name
        loadItems()
    }
    @IBOutlet var AddMoreUnitTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.AddMoreSearchBar.resignFirstResponder()
        
    }
    
    func loadItems() {
        EntireItemList = categoryName?.items.filter("picked == false").sorted(byKeyPath: "name", ascending: true)

    }
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (EntireItemList?.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = EntireItemList![indexPath.row].name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        AddMoreSearchBar.endEditing(true)
        AddMoreSearchBar.resignFirstResponder()
        if let selectedItem = EntireItemList?[indexPath.row] {
            
            try! realm.write {
                selectedItem.picked = !selectedItem.picked
            }
//            do{
//                try realm.write {
//                    selectedItem.picked = !selectedItem.picked
//                }
//            } catch {
//                print("Error changing the status \(error)")
//            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        tableView.reloadData()
        
        reloadDataDelegate?.reloadTable()
        
    }
 
    

    @IBAction func cancelButtoned(_ sender: UIBarButtonItem) {
        reloadDataDelegate?.reloadTable()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapToDismissFirstResponder(_ sender: UITapGestureRecognizer) {
        self.AddMoreSearchBar.resignFirstResponder()
    }
    
}
