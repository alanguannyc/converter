//
//  ViewController.swift
//  Converter
//
//  Created by Alan on 10/12/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import UIKit
import RealmSwift


class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    private var tapOnScreen: UITapGestureRecognizer!
    
    @IBOutlet weak var CategorySearchBar: UISearchBar!
    
    
    @IBAction func tapToDismissSearch(_ sender: Any) {
        self.CategorySearchBar.resignFirstResponder()
    }
    
    
    var requests : Array<Any>?
    
    var dataToPass : String?
    
    var categories : Results<UnitCategory>?
    lazy var realm = try! Realm()
    // You only need to do this once (per thread)
    @IBOutlet weak var categoryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("file location\(Realm.Configuration.defaultConfiguration.fileURL!)")
        if #available(iOS 9.0, *) {
            categoryTableView.cellLayoutMarginsFollowReadableWidth = true
        }
        
        
        self.tapOnScreen = UITapGestureRecognizer(target: self, action: Selector("tapToDismissSearch:"))

        self.view.addGestureRecognizer(self.tapOnScreen)
        tapOnScreen.cancelsTouchesInView = false
        
        
        // Register nib custom table cell
        
       
        categoryTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        
        categoryTableView.separatorStyle = .none
        
        // Do any additional setup after loading the view, typically from a nib.
       
        self.transitioningDelegate = self
        
        CategorySearchBar.delegate = self


        loadCategory()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadCategory()
    }
    
    func loadCategory() {
//        "id": Int(category["id"]! as! String)! as! Int,
        let categoryModel = CategoryModel()
        let defaultPath = Realm.Configuration.defaultConfiguration.fileURL?.path
        let alreadyExists = FileManager.default.fileExists(atPath: defaultPath!)
        
        if !alreadyExists {
            for category in categoryModel.categoryDataset {
                
                try! realm.write {
                    realm.create(UnitCategory.self, value: [ "name": category["name"] as! String, "items" : category["items"]], update: true)
                }
                
            }
        }
        
        categories = realm.objects(UnitCategory.self)
        requests = Array((categories?.filter("picked == true"))!)
        categoryTableView.reloadData()

    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return requests?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! TableViewCell
        cell.cellLabel.text = categories?.filter("picked == true")[indexPath.row].name
        cell.cellImage.image = UIImage(named: (categories?.filter("picked == true")[indexPath.row].name)!)
        cell.delegate = self
        cell.customBackgroundColor = UIColor(hexString: "941100")
        
        cell.contentView.backgroundColor = UIColor.clear
        
//        let whiteRoundedView : UIView = UIView(frame: CGRect(x: 10, y: 8, width: self.view.frame.size.width - 20, height: 80))
//        
//        whiteRoundedView.layer.backgroundColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [0.71, 0.24, 0.24, 1.0])
//        
//        whiteRoundedView.layer.masksToBounds = false
//        whiteRoundedView.layer.cornerRadius = 10.0
//        whiteRoundedView.layer.shadowOffset = CGSize(width: -1, height: 1)
//        whiteRoundedView.layer.shadowOpacity = 0.2
//        
//        cell.contentView.addSubview(whiteRoundedView)
//        cell.contentView.sendSubview(toBack: whiteRoundedView)
        
        let backgroundView = UIView()
        //        backgroundView.backgroundColor = cell.cellBackground.backgroundColor
        backgroundView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        cell.selectedBackgroundView = backgroundView
        
        
        return cell
     
    }
    
    var selectedCellBackground : UIColor?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.CategorySearchBar.resignFirstResponder()
        dataToPass = categories?[indexPath.row].name
//        self.categoryDelegate?.categorySelected(category: (categories?[indexPath.row].name)!)
      
        self.performSegue(withIdentifier: "unitSegue", sender: Any?.self)
        
        categoryTableView.deselectRow(at: indexPath, animated: true)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        

        
        if segue.identifier == "unitSegue" {
            let destinationVC = segue.destination as! UnitViewController
            destinationVC.transitioningDelegate = self
            destinationVC.modalPresentationStyle = .custom
            if let rowIndex = categoryTableView.indexPathForSelectedRow?.row {
                destinationVC.selectedCategory = categories?[rowIndex]
                destinationVC.titleName = (categories?[rowIndex].name)!
                if let cell = categoryTableView.cellForRow(at: categoryTableView.indexPathForSelectedRow!)! as? TableViewCell {

                    destinationVC.colorToPass = cell.customBackgroundColor
                }
            }
            
            
        }
        }
        

    }

extension CategoryViewController: UIViewControllerTransitioningDelegate {
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
}

