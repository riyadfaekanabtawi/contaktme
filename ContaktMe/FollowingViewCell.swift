//
//  FollowingViewCell.swift
//  
//
//  Created by Riyad Anabtawi on 7/23/15.
//
//

import UIKit

class FollowingViewCell: UICollectionViewCell {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var ImageView: UIImageView!
    @IBOutlet var fullName: UILabel!
    @IBOutlet var followLabel: UILabel!
    @IBOutlet var followView: UIView!
    @IBOutlet var customName: UILabel!
    var user: User! = nil
   
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
        
    }
    
    func displayPost(user:User) {
        
        
        self.user = user as User
        
        self.ImageView.sd_setImageWithURL(NSURL(string: self.user.profilepicture))
        self.fullName.text = user.user_name
        self.customName.text = user.custom_name
        
        
    }
    
    
}
