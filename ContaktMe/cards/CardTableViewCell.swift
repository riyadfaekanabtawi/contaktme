//
//  CardTableViewCell.swift
//  CardTilt
//
//  Created by Ray Fix on 6/25/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit
import QuartzCore

class CardTableViewCell: UITableViewCell {

    @IBOutlet var mainView: UIView!
    @IBOutlet var tagView: UIView!
    @IBOutlet var backView: UIView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var aboutLabel: UILabel!
    @IBOutlet var categoryTagLabel: UILabel!
    @IBOutlet var profilePictureView: UIImageView!
    @IBOutlet var webLabel: UILabel!
    @IBOutlet var webButton: UIButton!
    @IBOutlet var twitterButton: UIButton!
    @IBOutlet var twitterImage: UIImageView!
    @IBOutlet var facebookButton: UIButton!
    @IBOutlet var facebookImage: UIImageView!
    var memberMain:Member!
    var twitter:String?
    var facebook:String?
 
    
    func useMember(member:Member) {
        
        memberMain=member
        nameLabel.font = UIFont (name: "MovistarHeadline", size: nameLabel.font.pointSize)
        titleLabel.font = UIFont (name: "MovistarHeadline", size: titleLabel.font.pointSize)
        locationLabel.font = UIFont (name: "MovistarHeadline", size: locationLabel.font.pointSize)
        aboutLabel.font = UIFont (name: "MovistarHeadline", size: aboutLabel.font.pointSize)
        webLabel.font = UIFont (name: "MovistarHeadline", size: webLabel.font.pointSize)
        categoryTagLabel.font = UIFont (name: "MovistarHeadline", size: categoryTagLabel.font.pointSize)
        // Round those corners
        mainView.layer.cornerRadius = 10;
        mainView.layer.masksToBounds = true;
        backView.layer.cornerRadius = 10;
        backView.layer.masksToBounds = true;
        
        tagView.layer.cornerRadius = 10.0
        tagView.layer.masksToBounds = true;
        // Fill in the data
        categoryTagLabel.text = member.category
        nameLabel.text = String(format:"%@ %@", member.name!, member.lastname!)
        titleLabel.text = member.profession
        locationLabel.text = String(format:"%@, %@", member.city!, member.country!)
        aboutLabel.text = member.status_message
        profilePictureView.image = UIImage(named: member.avatar!)
        profilePictureView.layer.borderWidth=1.0
        profilePictureView.layer.masksToBounds = false
        profilePictureView.layer.borderColor = UIColor.whiteColor().CGColor
        profilePictureView.layer.cornerRadius = 13
        profilePictureView.layer.borderColor = UIColor.whiteColor().CGColor
        profilePictureView.layer.cornerRadius = profilePictureView.frame.size.height/2
        profilePictureView.clipsToBounds = true
        // Fill the buttons and show or hide them
        webLabel.text = member.mobilephone


        var layer = backView.layer
        
        
    
        layer.shadowOffset = CGSizeMake(1,1)
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.25
        layer.shadowPath = UIBezierPath(roundedRect: backView.frame, cornerRadius: 25).CGPath
        
        
//        if let facebookURLString = member.facebook {
//            facebookImage.hidden = false
//            facebook = facebookURLString
//        }
//        else {
//            facebookImage.hidden = true
//            facebook = nil
//        }
    }


    @IBAction func sendChatButtonTapped(sender: AnyObject) {
    }
    
    @IBAction func CallButtonTapped(sender: AnyObject) {
        let phone = NSString(format: "tel://%@", memberMain.mobilephone!) as String
        
        let url:NSURL = NSURL(string:phone)!;
        UIApplication.sharedApplication().openURL(url);
    }
    
    
    
    
}
