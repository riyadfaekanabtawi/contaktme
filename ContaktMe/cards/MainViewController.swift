//
//  MainViewController.swift
//  CardTilt
//
//  Created by Ray Fix on 6/25/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController,SWRevealViewControllerDelegate {

    var members:[Member] = []
    var didAnimateCell:[NSIndexPath: Bool] = [:]
    
    // #pragma mark - Model

    
    func loadModel() {
        let path = NSBundle.mainBundle().pathForResource("TeamMembers", ofType: "json")
        members = Member.loadMembersFromFile(path!)
    }
    
    

   
    // #pragma mark - View Lifetime
    
    override func viewDidLoad() {
        super.viewDidLoad()
            let revealViewController = SWRevealViewController()
        // appearance and layout customization
        self.tableView.backgroundColor = UIColor(white: 1, alpha: 1)
        self.tableView.estimatedRowHeight = 280
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.showsHorizontalScrollIndicator = false
        self.tableView.showsVerticalScrollIndicator = false
        self.navigationController?.navigationBar.tintColor = Functions.colorWithHexString("F35e46")
        
        let menuButton = UIButton(frame: CGRectMake(0, 0, 140, 17))
        
        menuButton.setBackgroundImage(UIImage(named:"logo.png"), forState: UIControlState.Normal)
        
           self.navigationItem.titleView = menuButton
        
 self.navigationItem.leftBarButtonItem?.title = "";
        self.navigationController?.navigationItem.rightBarButtonItem?.title=""
         self.navigationController?.navigationItem.backBarButtonItem?.title=""
        // load our model
        loadModel();
    }

    // #pragma mark - Table View

    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
            if didAnimateCell[indexPath] == nil || didAnimateCell[indexPath]! == false {
              
        }
        didAnimateCell[indexPath] = true
        TipInCellAnimator.animate(cell)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Card", forIndexPath: indexPath) as CardTableViewCell
        let member = members[indexPath.row]
        cell.useMember(member)
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    
    
}
