//
//  SearchViewCell.swift
//  
//
//  Created by Riyad Anabtawi on 7/26/15.
//
//

import UIKit

class SearchViewCell: UICollectionViewCell {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var ImageView: UIImageView!
    @IBOutlet var followIcon: UIImageView!
    @IBOutlet var fullName: UILabel!
    @IBOutlet var followLabel: UILabel!
    @IBOutlet var followView: UIView!
    @IBOutlet var customName: UILabel!
    var user: User! = nil
       var friends:[User] = []
    
    override func awakeFromNib() {
        
        self.customName.font=UIFont(name: FONT_MEDIUM, size: self.customName.font.pointSize)
        self.fullName.font=UIFont(name: FONT_REGULAR, size: self.fullName.font.pointSize)
        
        self.followView.layer.cornerRadius = 4
        self.followView.layer.masksToBounds = true
        self.followView.layer.borderWidth = 1
        self.followLabel.font = UIFont(name: FONT_MEDIUM, size: self.followLabel.font.pointSize)
        
        self.followView.layer.borderColor = Functions.colorWithHexString("6EB323").CGColor
        
        self.ImageView.layer.cornerRadius = 5
        self.ImageView.layer.masksToBounds = true
        
        
        self.followView.backgroundColor = UIColor.clearColor()
        self.followLabel.text = "SEGUIR"
        
        self.followLabel.textColor = Functions.colorWithHexString("6EB323")
        self.followIcon.image = UIImage(named: "icon_more.png")

        
    }
    
    func displayPost(user:User) {
        
        
        self.user = user as User
        
        self.ImageView.sd_setImageWithURL(NSURL(string: self.user.profilepicture))
        self.fullName.text = user.user_name
        self.customName.text = user.custom_name
        
        
           let defaults = NSUserDefaults.standardUserDefaults()
        
        let userFriendsData = defaults.objectForKey("user_friends") as! NSData
        let myID = defaults.objectForKey("user_id") as! Int
        
        
        if user.user_id.integerValue == myID{
            self.followView.hidden = true
            
        
        }else{
        
            self.followView.hidden = false
            if let objects = NSKeyedUnarchiver.unarchiveObjectWithData(userFriendsData) as? NSArray {
                
                
                
                var counts = -1 as Int
                self.friends = objects as! [User]
                
                self.followView.backgroundColor = UIColor.clearColor()
                self.followLabel.text = "SEGUIR"
                
                self.followLabel.textColor = Functions.colorWithHexString("6EB323")
                self.followIcon.image = UIImage(named: "icon_more.png")
                
                for myFriend in self.friends{
                    
                    if myFriend.user_id  == self.user.user_id{
                        
                        self.followIcon.image = UIImage(named: "icon_check.png")
                        self.followView.backgroundColor = Functions.colorWithHexString("6EB323")
                        self.followLabel.textColor = UIColor.whiteColor()
                        
                        self.followLabel.text = "SIGUIENDO"
                        break;
                      
                    }
                    
                    
                }
                
                
                
                
                
            }

        }
        
    

    
    }
    
    
    
    @IBAction func TapFollowView(sender: UIButton) {
        
          let defaults = NSUserDefaults.standardUserDefaults()
          let myID = defaults.objectForKey("user_id") as! Int
        
        if followLabel.text == "SEGUIR"{
        Services.addFriendVictim(self.user.user_id, fromAttacker: myID, withHandler: { (response) -> Void in
            
            self.followIcon.image = UIImage(named: "icon_check.png")
            self.followView.backgroundColor = Functions.colorWithHexString("6EB323")
            self.followLabel.textColor = UIColor.whiteColor()
            
            self.followLabel.text = "SIGUIENDO"
            
            
        }, orErrorHandler: { (err) -> Void in
            
            
            
            
        })
    
        
        }else{
        
        Services.removeFriendVictim(self.user.user_id, fromAttacker:myID, withHandler: { (response) -> Void in
                
            self.followView.backgroundColor = UIColor.clearColor()
            self.followLabel.text = "SEGUIR"
            
            self.followLabel.textColor = Functions.colorWithHexString("6EB323")
            self.followIcon.image = UIImage(named: "icon_more.png")
            
            
        }, orErrorHandler: { (err) -> Void in
          
        })
        
        }
    }
    
}
