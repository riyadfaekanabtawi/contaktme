//
//  MainViewController.swift
//  CardTilt
//
//  Created by Riyad Faek Anabtawi on 6/25/14.
//  Copyright (c) Riyad Faek Anabtawi. All rights reserved.
//

import UIKit

class Home: UIViewController,SWRevealViewControllerDelegate,UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate,SendPostDelegate,MenuViewControllerDelegate {

    var members:[Post] = []
    var friends:[User] = []
    var user_posts:[Post] = []
      @IBOutlet var tableViewBottom: NSLayoutConstraint!
    @IBOutlet var eliminarHeightOptions: NSLayoutConstraint!
    @IBOutlet var facebookHeightOptions: NSLayoutConstraint!
    @IBOutlet var twitterHeightOptions: NSLayoutConstraint!
    @IBOutlet var cancelarHeightOptions: NSLayoutConstraint!

    @IBOutlet var tableView: UITableView!
  
    @IBOutlet var optionsImage: UIImageView!
    
    @IBOutlet var blockView: UIView!
    
    var GoToSettingsAutomatically = false
    var refreshControl: UIRefreshControl!
    let imagePicker = UIImagePickerController()
    @IBOutlet var NavView: UIView!
    var userToProfile:User! = nil
    var selectedPost:Post! = nil
    @IBOutlet var reintentarView: UIView!
    @IBOutlet var reintentarLabel: UILabel!
    @IBOutlet var guau: UILabel!
    @IBOutlet var titleReintentar: UILabel!
    @IBOutlet var subTitleReintentar: UILabel!
    var indexPath: NSIndexPath! = nil
    
 
    
    
    @IBOutlet var twitterContainer: UIView!
    @IBOutlet var facebookContainer: UIView!
    @IBOutlet var deleteContainer: UIView!
    @IBOutlet var cancellContainer: UIView!
 
    




    

    
      ////////////
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
    }
    
    
    override func viewDidDisappear(animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //navigationController?.hidesBarsOnSwipe = true
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
             self.navigationController?.navigationBar.shadowImage = UIImage()
                self.navigationController?.navigationBar.translucent = true

        
    }
    
    // #pragma mark - View Lifetime
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self);
    }

    
    func keyboardWasShown(notification: NSNotification) {
        var info = notification.userInfo!
        var keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.tableViewBottom.constant = keyboardFrame.size.height
                  self.view.layoutIfNeeded()
        })
    }
    
    
    func keyboardWillHide(notification: NSNotification) {
        var info = notification.userInfo!
        var keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.tableViewBottom.constant = 54
            self.view.layoutIfNeeded()
        })
    }
    
    override func viewDidLoad() {
        
       // self.blockView.alpha=0.0
     self.setNeedsStatusBarAppearanceUpdate()
     
        self.reintentarView.hidden = true
        self.titleReintentar.font = UIFont (name: FONT_REGULAR, size: self.titleReintentar.font.pointSize)
        self.subTitleReintentar.font = UIFont (name: FONT_REGULAR, size: self.subTitleReintentar.font.pointSize)
        self.guau.font = UIFont (name: FONT_MEDIUM, size: self.guau.font.pointSize)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWasShown:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);

        
   
        self.optionsImage.layer.cornerRadius = 5
        self.optionsImage.layer.masksToBounds = true
    self.reintentarLabel.font = UIFont(name: FONT_REGULAR, size: self.reintentarLabel.font.pointSize)
       
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "refescando")
        self.refreshControl.addTarget(self, action: "callHomeService", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refreshControl)
        self.tableView.setContentOffset(CGPointMake(0, 20), animated: true)

        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true

        super.viewDidLoad()
        self.tableView.rowHeight = self.view.frame.size.height - 100
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationItem.leftBarButtonItems = []
        let revealViewController = SWRevealViewController()
        // appearance and layout customization
        self.navigationController?.setNavigationBarHidden(navigationController?.navigationBarHidden == false, animated: true)
   
        self.navigationController?.navigationBar.tintColor = Functions.colorWithHexString("F35e46")
        var navigationBarAppearace = UINavigationBar.appearance()
        
        navigationBarAppearace.tintColor = Functions.colorWithHexString("4A90E2")
        navigationBarAppearace.barTintColor = Functions.colorWithHexString("4A90E2")
        navigationBarAppearace.backgroundColor = Functions.colorWithHexString("4A90E2")


self.callHomeService()
        
        
    }
    
    
    
    
    func slideMenuSetup() {
        
        
        
        if let revealViewController = self.revealViewController() {
            revealViewController.delegate = self
            revealViewController.toggleAnimationDuration = 0.5
            
            revealViewController.rearViewRevealWidth = 0
            self.navigationController?.navigationBar.addGestureRecognizer(revealViewController.panGestureRecognizer())
            
            let menu = revealViewController.rearViewController as! MenuViewController
          
            menu.delegate = self
        }
        
}
    
    
 
    @IBAction func menuButtonTouchUpInside(sender: UIButton) {
        if let revealViewController = self.revealViewController() {
            revealViewController.revealToggleAnimated(true)
            
//            UIView.animateWithDuration(0.3, animations: { () -> Void in
//                self.blockView.alpha=1.0
//                  self.blockView.hidden=false
//            })
        }
    }
    
    
    @IBAction func TapBlockViewTouchUpInisde(sender: UIButton) {
        
    
                 self.revealViewController().revealToggleAnimated(true)
                UIView.animateWithDuration(0.3, animations: { () -> Void in
//                    self.blockView.alpha=0.0
//                    self.blockView.hidden=true
                })
                
       
      
    }
    
    // #pragma mark - Table View
    

    
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Card", forIndexPath: indexPath) as! CardTableViewCell
        let member = members[indexPath.row]
       // cell.delegate  = self
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let user_id = defaults.objectForKey("user_id") as! Int
        Services.checkLikeForUserWithID(user_id, andPost: member.post_id, andHandler: { (response) -> Void in
            
            let res = response as! String
            
            
            
            if res == "YES"{
                
                cell.favorite_button.selected = true
            }else{
                
                cell.favorite_button.selected = false
                
            }
            
            
            }) { (err) -> Void in
                
                
                
        }
        
        self.indexPath = indexPath
                cell.useMember(member,indexPath: indexPath.row)
    
        return cell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
//    internal override func preferredStatusBarStyle() -> UIStatusBarStyle {
//        return UIStatusBarStyle.LightContent
//    }
//    
    
    
    
    
    

  
    //END CAMERA VIEW
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
   
     
    }
    
    
  
    
    
    func postedComment() {
        self.callHomeService()
    }
    
    
    func callHomeService(){
        
        let loader  = SBTVLoaderView.create()
        let frontView = UIApplication.sharedApplication().keyWindow
        
 
        let window = UIApplication.sharedApplication().keyWindow
        if let sub =   window?.subviews[0] as? UIView{
            
            Functions.fillContainerView(sub, withView: loader)
            
        }
        
 
    
        Services.getAllRecipesWithHandler({ (response) -> Void in
            
            self.members = response as! [Post]
                   self.reintentarView.hidden=true
            if(self.members.count==0){
                self.tableView.hidden = true
             
                
            }else{
                self.tableView.hidden = false
           
                self.tableView.reloadData()
                //self.animateTable()
            }
            
               loader.removeFromSuperview()
             self.tableView.contentOffset = CGPointMake(0, 0);
            self.refreshControl.endRefreshing()
            }, orErrorHandler: { (err) -> Void in
                self.reintentarView.hidden=false
                self.tableView.hidden = true
       
             self.refreshControl.endRefreshing()
        })
        

    
    }
    

    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        
        return UIStatusBarStyle.LightContent
        
    }
    @IBAction func GoToSettings(sender: UIButton) {
        self.GoToSettingsAutomatically = false
        self.performSegueWithIdentifier("settings", sender: self)
    }
    
    //SETTINGS DELEGATES
    
 
    
    func loggedOut() {
    
        
      
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(nil, forKey: "user_id")
        defaults.setObject(nil, forKey: "user_name")
        defaults.setObject(nil, forKey: "user_email")
        defaults.setObject(nil, forKey: "user_id")
        defaults.setObject(nil, forKey: "user_image")
        defaults.synchronize()
          var token = FBSDKAccessToken().tokenString
        
        let loginManager = FBSDKLoginManager()
        loginManager.logOut()
      Functions.doLogout()
      

        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
          let member = members[indexPath.row]
        if member.comments.count == 0{
            
        return 470
            
        }else{
          return 540
            
            
        }

        
        
    }
    
    
    
    
    
    
    
   
    
    
  
    @IBAction func showPost(sender: UIButton) {
        
        
    self.performSegueWithIdentifier("sendPost", sender: self)
        
 
        
    }
    
    
  
    
    func didSelectOption(option: String!) {
        
        
        if let revealViewController = self.revealViewController() {
            revealViewController.revealToggleAnimated(true)

        }
        
    }
    
    
}
    
    

