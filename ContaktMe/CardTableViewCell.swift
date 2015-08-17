//
//  CardTableViewCell.swift
//  CardTilt
//
//  Created by Ray Fix on 6/25/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit
import QuartzCore
protocol cardCellDelegate{
    func postedComment()
    func selectedProfile(user:User)
    func selectedOptions(post:Post)
    func selectedOptionsNoDelete(post:Post)
    func refreshHomeAtIndex(index:Int)
    func selectedPost(post:Post)
    
}
class CardTableViewCell: UITableViewCell,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,CommentsCellDelegate  {

    @IBOutlet var mainView: UIView!

    @IBOutlet var profilePic: UIImageView!
    @IBOutlet var heart_Big: UIImageView!
     @IBOutlet var WebView: UIWebView!
@IBOutlet var heartLittleiCon: UIButton!
    @IBOutlet var sendPostIcon: UIButton!
     @IBOutlet var postPic: UIImageView!
     @IBOutlet var commentTableView: UITableView!
    @IBOutlet var commentTextField: UITextField!
     @IBOutlet var commentsHeight: NSLayoutConstraint!
    @IBOutlet var likesHeight: NSLayoutConstraint!
    @IBOutlet var descriptionHeight: NSLayoutConstraint!
     @IBOutlet var mainViewHeight: NSLayoutConstraint!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var favorite_button: UIButton!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var optionsButton: UIButton!

    var number: NSNumber! = 1
    @IBOutlet var likesLabel: UILabel!
    var memberMain:Post!
     var delegate:cardCellDelegate! = nil
 var didAnimateCell:[NSIndexPath: Bool] = [:]
  var members:[Comment] = []
    
    var indexPathMain: Int! = 0
    
    func useMember(member:Post, indexPath:Int) {
        
 self.indexPathMain = indexPath
        self.memberMain=member
        // Round those corners
   
  
        if member.user_owner.custom_name == ""{
        
        self.nameLabel.text=member.user_owner.user_name
        
        }else{
        self.nameLabel.text=member.user_owner.custom_name
        
        }
        
 
    
        let imageStringProfile  =  member.user_owner.profilepicture as String
         let postImage  =  BASE_URL + member.post_image as String
        
        
        
        if member.user_owner.profilepicture == "placeholder"{
         self.profilePic.image = UIImage(named: "fer.png")
        
        }else{
        self.profilePic.sd_setImageWithURL(NSURL(string: imageStringProfile))
        
        }
     
        
        self.members = member.comments as! [Comment]
       
      
        
      
        
        if member.hours_since.integerValue <= 0 && member.minutes_since.integerValue <= 0 && member.seconds_since.integerValue > 0{
        
        self.timeLabel.text = "\(member.seconds_since)sec"
        
        }
        
        if member.hours_since.integerValue <= 0 && member.minutes_since.integerValue > 0 && member.seconds_since.integerValue > 0{
            
            self.timeLabel.text = "\(member.minutes_since) min"
            
        }
        
       
       if member.hours_since.integerValue > 0 && member.minutes_since.integerValue > 0 && member.seconds_since.integerValue > 0{
        
        
            
            self.timeLabel.text = "\(member.hours_since) hs"
            
        }
        
        if member.days_since.integerValue > 0 && member.hours_since.integerValue > 0 && member.minutes_since.integerValue > 0 && member.seconds_since.integerValue > 0{
            
            
            
            self.timeLabel.text = "\(member.days_since) days"
            
        }
        
        
    
        
        if member.post_likes.integerValue > 0{
        
        self.favorite_button.selected = true
            self.likesHeight.constant=20
                self.likesLabel.text = "\(self.memberMain.post_likes) Me gusta"
            self.layoutIfNeeded()
        }else{
        
         self.favorite_button.selected = false
            self.likesHeight.constant=0
                self.likesLabel.text = "\(self.memberMain.post_likes) Me gusta"
            self.layoutIfNeeded()
        }
        
        
        
        var htmlString = "<html style='background-color: transparent; margin:0; padding:0;'><style> div { font-family: DINPro-Bold; } </style><body style='background-color: transparent;margin:0; padding:0;'><div style='margin-top:%fpx; padding:5px;color:#000;font-size: 22px;'></div><div style='margin:0 0 0 0; padding: 10px; background-color: rgb(237,237,237);'><div style='margin-top: 0px; margin-bottom: 5px; color: #5F5F5F; font-size: 18px;'>" + member.post_description + "</div><div style='color: #000000;font-size: 12px;'>" + member.post_description +  "</div><br><div style='color: #000000;font-size: 12px;'>Remuneration: " + member.post_remuneration
        
        htmlString = htmlString + "</div><br><div style='color: #000000;font-size: 12px;'>Location: " + member.post_location + "</div><hr><br><div style='color: #000000;font-size: 12px;'>Bennefits: " + member.post_bennefits + "</div></div></body></html>"
        
        self.WebView.scrollView.delegate = self;
        self.WebView.loadHTMLString(htmlString, baseURL: nil)
        self.WebView.backgroundColor = UIColor.clearColor()
    }

    override func awakeFromNib() {
     
        self.nameLabel.font=UIFont(name: FONT_REGULAR, size: self.nameLabel.font.pointSize)
        self.timeLabel.font=UIFont(name: FONT_REGULAR, size: self.timeLabel.font.pointSize)

        self.profilePic.layer.cornerRadius = 5;
        self.profilePic.layer.masksToBounds = true
      
        self.heart_Big.alpha = 0.0
    
        self.likesLabel.font=UIFont(name: FONT_MEDIUM, size: self.likesLabel.font.pointSize)
        self.mainViewHeight.constant = self.frame.size.height
        self.layoutIfNeeded()
        
        
        
 
    }
    
   
    
    
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
   
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.members.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CommentCell", forIndexPath: indexPath) as! CommentsCell
        let member = members[indexPath.row]
        
        cell.useMember(member)
        cell.delegate = self
        return cell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
  func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
    
    

    
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }
    
    
    
    @IBAction func selectedProfile(sender: AnyObject) {
   
        self.delegate.selectedProfile(memberMain.user_owner)
        
    }
    
    @IBAction func selectedOptions(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let myID = defaults.objectForKey("user_id") as! NSNumber
        
        
        
        if memberMain.user_owner.user_id == myID{
        self.delegate.selectedOptions(self.memberMain)
        }else{
            self.delegate.selectedOptionsNoDelete(self.memberMain)
            
         
        }
        
    }
    func selectedComment(comment_user: User) {
        
         self.delegate.selectedProfile(comment_user)
        
        
    }
    
    
    
    
    @IBAction func selectedFav(sender: AnyObject) {
  
        
      //  if self.favorite_button.selected == false {
        self.heartLittleiCon.transform = CGAffineTransformMakeScale(0.1, 0.1)
        self.heartLittleiCon.selected = true
        UIView.animateWithDuration(2.0,
            delay: 0,
            usingSpringWithDamping: 0.20,
            initialSpringVelocity: 6.00,
            options: UIViewAnimationOptions.AllowUserInteraction,
            animations: {
                self.heartLittleiCon.transform = CGAffineTransformIdentity
            }, completion: nil)
      
      
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let user_id = defaults.objectForKey("user_id") as! Int
        
        let scale = CGAffineTransformMakeScale(0.0, 0.0)
        let translate = CGAffineTransformMakeTranslation(0.0, 0.0)
        
        let scale2 = CGAffineTransformMakeScale(0.1, 0.1)
        let translate2 = CGAffineTransformMakeTranslation(0.1, 0.1)
        self.heart_Big.transform = CGAffineTransformConcat(scale,translate);
        UIView.animateWithDuration(0.6, animations: {
            self.heart_Big.transform = CGAffineTransformIdentity
            self.heart_Big.alpha=1.0
            
            self.likesHeight.constant=20
            self.layoutIfNeeded()
            }, completion: {
                (value: Bool) in
                
                UIView.animateWithDuration(0.6, animations: {
                    self.heart_Big.transform = CGAffineTransformConcat(scale2,translate2);
                    self.heart_Big.alpha=0.0
                    }, completion: {
                        (value: Bool) in
                        self.heart_Big.transform = CGAffineTransformConcat(scale,translate);
                         self.likesLabel.text = "\(self.memberMain.post_likes.integerValue + 1) Me gusta"
                        Services.LikePost(self.memberMain.post_id, byUser: user_id, withHandler: { (response) -> Void in

                            }, orErrorHandler: { (err) -> Void in
                                
    
                        })
                })
                
        })
        
        
    }
        
            
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let myID = defaults.objectForKey("user_id") as! NSNumber
        let member = self.members[indexPath.row]
        
        if member.comment_owner.user_id.integerValue == myID.integerValue{
        
         return true
        
        }else{
        
         return false
        
        }
        
        
       
    }
    
    func tableView(tableView: UITableView,commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            let defaults = NSUserDefaults.standardUserDefaults()
            let myID = defaults.objectForKey("user_id") as! NSNumber
            
                  let member = self.members[indexPath.row]
            
    Services.DestroyCommentForUser(myID, andComment: member.comment_id, withHandler: { (response) -> Void in
        let comment: Comment!
        

        var commentsAll = self.members
    
 
        commentsAll.removeAtIndex(indexPath.row)
        
        self.members = commentsAll
        
        self.commentTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        
        
        
      
        UIView.animateWithDuration(0.4, animations: {
            
            self.commentsHeight.constant = self.commentsHeight.constant - 25
            
            self.layoutIfNeeded()
            }, completion: {
                (value: Bool) in
                
                
        })
    
   }, orErrorHandler: { (err) -> Void in
    
    
    
    
            })
            
            
            
        }
    }
    
    
    
    
    
    @IBAction func selectPostTouchUpInside(sender: AnyObject) {
      self.delegate.selectedPost(memberMain)
        
        
    }
    
    
    

}




    
