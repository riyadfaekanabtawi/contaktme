//
//  FollowingViewCell.swift
//
//
//  Created by Riyad Anabtawi on 7/23/15.
//
//

import UIKit

class NotificationViewCell: UICollectionViewCell {
     @IBOutlet var userImage: UIImageView!
    @IBOutlet var mainView: UIView!
    @IBOutlet var postImge: UIImageView!
    @IBOutlet var notificationLabel: UILabel!
@IBOutlet var checkView: UIView!

    var notification: Notification! = nil
    
    override func awakeFromNib() {
        
        self.postImge.layer.cornerRadius = 5
        self.postImge.layer.masksToBounds = true
        
        self.userImage.layer.cornerRadius = 5
        self.userImage.layer.masksToBounds = true
      
        
        self.checkView.layer.cornerRadius = 5
        self.checkView.layer.masksToBounds = true
        
    }
    
    func displayNotification(notification:Notification) {
        
        
        self.notification = notification as Notification
        
        
       self.notificationLabel.text = self.notification.notification_user.custom_name + " comentó " + self.notification.notification_content + " en la foto"
        
        self.userImage.sd_setImageWithURL(NSURL(string: self.notification.notification_user.profilepicture))
        
         self.notificationLabel.setTextColor(Functions .colorWithHexString("4A90E2"), beforeOccurenceOfString: " comentó")
    
        
        self.notificationLabel.setFont(UIFont(name: FONT_REGULAR, size: self.notificationLabel.font.pointSize-4), afterOccurenceOfString: self.notification.notification_user.custom_name)
        
            self.notificationLabel.setFont(UIFont(name: FONT_BOLD, size: self.notificationLabel.font.pointSize), beforeOccurenceOfString: " comentó")
        
        
        Services.getRecipeDetailWithID(self.notification.notification_recipe_id, withHandler: { (response) -> Void in
        
            let idString = self.notification.notification_recipe_id.stringValue as String
      
            let post = response as! Post
            
         self.postImge.sd_setImageWithURL(NSURL(string:BASE_URL + post.post_image ))
            
        }) { (err) -> Void in
         
            
            
        }
    
        
    }
    
    
}
