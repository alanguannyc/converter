//
//  UnitViewController.swift
//  Converter
//
//  Created by Alan on 10/15/18.
//  Copyright © 2018 AlanG. All rights reserved.
//

import UIKit
import RealmSwift

class UnitViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

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
        }
    }
    var unitItems : Results<UnitItem>?
    
    
    var unitModel = UnitModel()
    
   
    
    @IBOutlet weak var itemTableView: UITableView!
    
    
   
    override func viewWillAppear(_ animated: Bool) {

//        DispatchQueue.main.async {
//            self.itemTableView.reloadData()
//        }
//        unitItems = selectedCategory?.items.sorted(byKeyPath: "name", ascending: true)
        
        
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
    func loadItems() {
        unitItems = selectedCategory?.items.sorted(byKeyPath: "name", ascending: true)
//        itemTableView.reloadData()
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
        
        
        
        itemTableView.register(UINib(nibName: "UnitTableViewCell", bundle: nil), forCellReuseIdentifier: "UnitTableViewCell")
        itemTableView.separatorColor = UIColor.lightGray
        
        itemTableView.dragInteractionEnabled = true
        
        itemTableView.dataSource = self
        itemTableView.delegate = self
        
        itemTableView.dragDelegate = self
        itemTableView.dropDelegate = self
        
       
        // Do any additional setup after loading the view.
        
        
        
        
        // Auto Update the size of the UITableView
        itemTableView.reloadData()
        itemTableView.layoutIfNeeded()
    }
    
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
    
    


}
