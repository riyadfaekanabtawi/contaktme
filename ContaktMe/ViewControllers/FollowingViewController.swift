//
//  FollowingViewController.swift
//  
//
//  Created by Riyad Anabtawi on 7/23/15.
//
//

import UIKit




class FollowingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var titleView: UILabel!
       @IBOutlet var EstoySiguiendo: UILabel!
       @IBOutlet var noContent: UILabel!
       @IBOutlet var followingCollectionView: UICollectionView!
    
        var following:[User] = []
    
    
    func collectionView(collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int{
            
            
            return self.following.count
            
    }
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int{
        
        
        return 1
        
    }
    
    
    
    func collectionView(collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("following",
                forIndexPath: indexPath) as! FollowingViewCell
            
            
            let user = self.following[indexPath.row] as User
            
            
            
            cell.displayPost(user)
            
            return cell
            
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
            
           
            
            return CGSizeMake(self.view.frame.size.width, 50)
            
            
    }
    
    
    override func viewDidLoad() {
        self.noContent.hidden = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.titleView.font=UIFont(name: FONT_MEDIUM, size: self.titleView.font.pointSize)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        self.EstoySiguiendo.font=UIFont(name: FONT_REGULAR, size: self.EstoySiguiendo.font.pointSize)
        self.noContent.font=UIFont(name: FONT_REGULAR, size: self.noContent.font.pointSize)
        self.loadFollowing()
        
    }
    
    
    
    
    func loadFollowing(){
    let defaults = NSUserDefaults.standardUserDefaults()
        
        let user_id = defaults.objectForKey("user_id") as! NSNumber
        
    Services.getFollowingForUserInfoWithID(user_id, andHandler: { (response) -> Void in
        
        
     self.following = response as! [User]
        
        if self.following.count == 0{
        self.noContent.hidden = false
            self.followingCollectionView.hidden = true
        }else{
            self.followingCollectionView.reloadData()
            self.noContent.hidden = true
            self.followingCollectionView.hidden = false
        }
 
        
    }) { (err) -> Void in
        
        
        
        
        }
    
    }
    
    
    
    @IBAction func goBack(sender: UIButton) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
        
    }
}
