//
//  AddMoreCategoryTableViewController.swift
//  Converter
//
//  Created by Alan on 12/6/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import UIKit
import RealmSwift

class AddMoreCategoryTableViewController: UITableViewController {
    
    lazy var realm = try! Realm()
    var EntireCateogryList : Results<UnitCategory>?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "categoryCell")
        loadItems()
    }

    
    
    func loadItems() {
        EntireCateogryList = realm.objects(UnitCategory.self).filter("picked == false")
    }

    @IBAction func DismissModal(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntireCateogryList?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        cell.textLabel?.text = EntireCateogryList![indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        try! realm.write {
            EntireCateogryList![indexPath.row].picked = true
        }
        
        tableView.reloadData()
    }

    

}
