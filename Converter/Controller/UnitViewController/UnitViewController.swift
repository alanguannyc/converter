//
//  UnitViewController.swift
//  Converter
//
//  Created by Alan on 10/15/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import UIKit
import RealmSwift
import SwipeCellKit
import SwiftyJSON
import Alamofire



protocol DataModelDelegate: class {
    func receiveData(data: String)
}

class UnitViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    var currency = [[String : Double]]()
    var dataToPass : String?
    
    var unitToMoniter : String?
    var unitValueToMoniter : Double?
    
    @IBOutlet weak var bottomHeight: NSLayoutConstraint!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var titleLabel: UILabel!
    var titleName : String = ""
    var colorToPass : UIColor?
    var selectedCategory : UnitCategory?
    {
        didSet{
            loadItems()
            
//            OperationQueue.main.addOperation { // this will not crash
//                self.itemTableView.reloadData()
//            }
            
            
        }
    }
    
    weak var dataDelegate: DataModelDelegate?
    
    func sendData() {
        print("started sending")
        
        dataDelegate?.receiveData(data: dataToPass!)
    }
    
    var unitItems : Results<UnitItem>?
    
    var requests : Array<Any>?
    
    var unitModel = UnitModel()
    
    var multiplier : Double?
    
    var euroCurrency : Double?
    
    let realm = try! Realm()
    
    @IBOutlet weak var itemTableView: UITableView!
    
    
   
    override func viewWillAppear(_ animated: Bool) {
        unitItems = selectedCategory?.items.filter("picked == true")
        itemTableView.reloadData()
        
//        DispatchQueue.main.async {
//            self.itemTableView.reloadData()
//        }

        dataToPass = selectedCategory?.name
        
        titleLabel.text = titleName
        contentView.backgroundColor = colorToPass
        itemTableView.backgroundColor = UIColor.clear
        
        self.tableHeight.constant = 300;
        self.itemTableView.estimatedRowHeight = UITableView.automaticDimension
        bottomHeight.constant = 10
        tableHeight.constant = itemTableView.contentSize.height
       
    }
    override var preferredContentSize: CGSize {
        get {
            self.itemTableView.layoutIfNeeded()
            return self.itemTableView.contentSize
        }
        set {}
    }
    
    // MARK: - Load Item Method
    func loadItems() {
        unitItems = selectedCategory?.items.filter("picked == true")
        

    }
    // Auto Update the size of the UITableView 
    override func viewWillLayoutSubviews() {
        
        super.updateViewConstraints()
        
    }
   
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
    }
    
    
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        requests = Array((selectedCategory?.items.filter("picked == true"))!)
        // Update Currency Array
        var symbols : String = ""
        for request in unitItems! {
//            symbols += (Currency.CurrencyUnit(rawValue: request.name)?.currencyIdentifier)! + ","
        }
        
//        let baseParams: Parameters = [
//            "symbols" : symbols.dropLast(),
////            "api_key" : Currency.API_KEY
//        ]
        if selectedCategory!.name == "Currency" {
            Alamofire.request(Currency.baseURL, method: .get, encoding: URLEncoding(destination: .queryString)).responseJSON { (response) in
                print("Request: \(response.request)")
                switch response.result {
                case .success(let value):
                    
                    let json = JSON(value)["rates"]
                    for item in self.unitItems! {
                        if (item.name == "Euro" ){
                            let newCurrency = ["EUR" : 1.0]
                            self.currency.append(newCurrency as! [String : Double])
                        } else {
                            
                        let newCurrency = [(Currency.CurrencyUnit(rawValue: item.name)?.currencyIdentifier)! : json[(Currency.CurrencyUnit(rawValue: item.name)?.currencyIdentifier)!].double]
                            self.currency.append(newCurrency as! [String : Double])
                        }
                        
                        
                    }
                    
                    print("JSON: \(json)")
                    
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
        
        
        itemTableView.register(UINib(nibName: "UnitTableViewCell", bundle: nil), forCellReuseIdentifier: "UnitTableViewCell")
        itemTableView.separatorColor = UIColor.lightGray
        
        itemTableView.dragInteractionEnabled = true
        
        itemTableView.dataSource = self
        itemTableView.delegate = self
        
        itemTableView.dragDelegate = self
        itemTableView.dropDelegate = self
        
       
        // Do any additional setup after loading the view.
        
        
        // Create a basevalue for converting and formatter
        
        let formatter = MeasurementFormatter()
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .spellOut
        formatter.numberFormatter = numberFormatter
        
        formatter.numberFormatter.numberStyle = .none
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .medium
        formatter.locale = Locale(identifier: "en-US")
        

        
        // Auto Update the size of the UITableView
        itemTableView.reloadData()
        itemTableView.layoutIfNeeded()
    }
    
//    var basevalue = Measurement(value: 0.0, unit: UnitLength.meters)
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.layoutIfNeeded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var cellIsHidden : Bool = false
    var selectedIndex : Int = -1
   
    @IBAction func dismissButtoned(_ sender: Any) {

        dismiss(animated: true, completion: nil)
    }
    
     var initialTouchPoint: CGPoint = CGPoint(x: 0,y: 0)
    
    @IBAction func closeSwipeUp(_ sender: UIPanGestureRecognizer) {
        swipeUpToClose(sender: sender)
    }
    
  
    
    
    public func swipeUpToClose (sender: UIPanGestureRecognizer) {
        let touchPoint = sender.location(in: self.view?.window)
        
        if sender.state == UIGestureRecognizer.State.began {
            initialTouchPoint = touchPoint
        } else if sender.state == UIGestureRecognizer.State.changed {
            if touchPoint.y - initialTouchPoint.y > 0 {
                self.view.frame = CGRect(x: 0, y: touchPoint.y - initialTouchPoint.y, width: self.view.frame.size.width, height: self.view.frame.size.height)
            }
        } else if sender.state == UIGestureRecognizer.State.ended || sender.state == UIGestureRecognizer.State.cancelled {
            if touchPoint.y - initialTouchPoint.y > 120 {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
                })
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddMoreItem" {
            let destinationVC = segue.destination as! UINavigationController
            let targetController = destinationVC.topViewController as! AddMoreUnitTableViewController

            targetController.categoryName = selectedCategory
        }
    }

    @IBAction func AddMoreUnit(_ sender: UIButton) {
        performSegue(withIdentifier: "AddMoreItem", sender: Any?.self)
    }
    
}
