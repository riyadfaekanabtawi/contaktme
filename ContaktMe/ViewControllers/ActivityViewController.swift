//
//  FollowingViewController.swift
//
//
//  Created by Riyad Anabtawi on 7/23/15.
//
//

import UIKit

class ActivityViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var titleView: UILabel!
     var refreshControl: UIRefreshControl!
    @IBOutlet var noContent: UILabel!
    @IBOutlet var followingCollectionView: UICollectionView!
    var selectedNotificarion: NSNumber = 0
    var following:[Notification] = []
    
    
    func collectionView(collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int{
            
            
            return self.following.count
            
    }
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int{
        
        
        return 1
        
    }
    
    
    
    func collectionView(collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("notifications",
                forIndexPath: indexPath) as! NotificationViewCell
            
            
            let notification = self.following[indexPath.row] as Notification
            
            
            
            cell.displayNotification(notification)
            
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
        
        self.noContent.font=UIFont(name: FONT_REGULAR, size: self.noContent.font.pointSize)
        self.loadFollowing()
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "refrescando tus notificaciones")
        self.refreshControl.addTarget(self, action: "loadFollowing", forControlEvents: UIControlEvents.ValueChanged)
        self.followingCollectionView.addSubview(refreshControl)
    }
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let noti = self.following[indexPath.row] as Notification
        
        self.selectedNotificarion = noti.notification_recipe_id
        self.performSegueWithIdentifier("showPost", sender: self)
        
    }
    func loadFollowing(){
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let user_id = defaults.objectForKey("user_id") as! NSNumber
        
        Services.getActivityForUserInfoWithID(user_id, andHandler: { (response) -> Void in
            
            
            self.following = response as! [Notification]
            
            if self.following.count == 0{
                self.noContent.hidden = false
                self.followingCollectionView.hidden = true
            }else{
                self.followingCollectionView.reloadData()
                self.noContent.hidden = true
                self.followingCollectionView.hidden = false
            }
                self.refreshControl.endRefreshing()
            
            }) { (err) -> Void in
                        self.followingCollectionView.hidden = true
                self.noContent.hidden = false
                self.noContent.text = "Revisa tu conexión a internet."
                 self.refreshControl.endRefreshing()
                
                
        }
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        
        if segue.identifier == "showPost" {
        
        let controller  = segue.destinationViewController as! PostDetailViewController
            controller.post_id = self.selectedNotificarion
        
        }
        
        
        
        
        
   
}

}
