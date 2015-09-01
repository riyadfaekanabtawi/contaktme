//
//  MainViewController.swift
//  CardTilt
//
//  Created by Riyad Faek Anabtawi on 6/25/14.
//  Copyright (c) Riyad Faek Anabtawi. All rights reserved.
//

import UIKit

class Home: UIViewController,SWRevealViewControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UINavigationControllerDelegate,SendPostDelegate,MenuViewControllerDelegate,cardCellDelegate {

    var members:[Post] = []
    var friends:[User] = []
    var user_posts:[Post] = []


    @IBOutlet var homecollectionView: UICollectionView!
  
    @IBOutlet var optionsImage: UIImageView!
    
    @IBOutlet var blockView: UIView!
    @IBOutlet var tapGestureBlock: UITapGestureRecognizer!
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
        
//        UIView.animateWithDuration(0.1, animations: { () -> Void in
//            self.tableViewBottom.constant = keyboardFrame.size.height
//                  self.view.layoutIfNeeded()
//        })
    }
    
    
    func keyboardWillHide(notification: NSNotification) {
        var info = notification.userInfo!
        var keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
//        UIView.animateWithDuration(0.1, animations: { () -> Void in
//            self.tableViewBottom.constant = 54
//            self.view.layoutIfNeeded()
//        })
    }
    
    override func viewDidLoad() {
        self.slideMenuSetup()
       self.blockView.alpha=0.0
        self.blockView.hidden = true
        self.tapGestureBlock.enabled = false
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
        self.homecollectionView.addSubview(refreshControl)
        self.homecollectionView.setContentOffset(CGPointMake(0, 20), animated: true)

        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true

        super.viewDidLoad()
       
        
        
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
            
            revealViewController.rearViewRevealWidth = 200
            self.navigationController?.navigationBar.addGestureRecognizer(revealViewController.panGestureRecognizer())
            
            let menu = revealViewController.rearViewController as! MenuViewController
          
            menu.delegate = self
        }
        
}
    
    
 
    @IBAction func menuButtonTouchUpInside(sender: UIButton) {
        if let revealViewController = self.revealViewController() {
            revealViewController.revealToggleAnimated(true)
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.blockView.alpha=1.0
                  self.blockView.hidden=false
                   self.tapGestureBlock.enabled = true
            })
        }
    }
    
    
    @IBAction func TapBlockViewTouchUpInisde(sender: UIButton) {
        
    
                 self.revealViewController().revealToggleAnimated(true)
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                   self.blockView.alpha=0.0
                   self.blockView.hidden=true
                       self.tapGestureBlock.enabled = false
                })
                
       
      
    }
    
 
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == ""{
        
        let controller = segue.destinationViewController as! SearchViewController
  
        }
     
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
                self.homecollectionView.hidden = true
             
                
            }else{
                self.homecollectionView.hidden = false
           
                self.homecollectionView.reloadData()
                //self.animateTable()
            }
            
               loader.removeFromSuperview()
             self.homecollectionView.contentOffset = CGPointMake(0, 0);
            self.refreshControl.endRefreshing()
            }, orErrorHandler: { (err) -> Void in
                self.reintentarView.hidden=false
                self.homecollectionView.hidden = true
       
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
    
    func didSelectMenuOption(option: String!) {
        
        
        if let revealViewController = self.revealViewController() {
            revealViewController.revealToggleAnimated(true)
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.blockView.alpha=0.0
                self.blockView.hidden=true
                self.tapGestureBlock.enabled = false
            })
        }
        
        
        
        if option == "logout"{
            
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(nil, forKey: "user_id")
            defaults.setObject(nil, forKey: "user_name")
            defaults.setObject(nil, forKey: "user_email")
            defaults.setObject(nil, forKey: "user_image")
            defaults.synchronize()
            var token = FBSDKAccessToken().tokenString
            
            let loginManager = FBSDKLoginManager()
            loginManager.logOut()
            Functions.doLogout()
            
            
            
            self.navigationController?.popToRootViewControllerAnimated(true)
            
        }
        
        if option == "topJobs"{
        
        
        self.performSegueWithIdentifier("topJobs", sender: self)
        }
        
        
        
    }
    
   
    
    
    
    
    
    //CARD HOME DELEGATE
    
    func selectedOptionsNoDelete(post: Post) {
        
    }
    
    
    func selectedOptions(post: Post) {
        
    }
    
    
    func selectedPost(post: Post) {
        
    }
    
    
    func refreshHomeAtIndex(index: Int) {
        
    }
    
    func selectedProfile(user: User) {
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("homecell", forIndexPath: indexPath) as! HomeCollectionViewCell
        let job = self.members[indexPath.row]
        cell.displayJob(job)
        return cell
        
        
        
    }
    
    
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        
        
        
        
    }
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return self.members.count
        
    }
    
    
     func collectionView(collctionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
    
    
    return CGSizeMake(self.view.frame.size.width, 300)
    
    }
    
    
    
    
}
    
    

