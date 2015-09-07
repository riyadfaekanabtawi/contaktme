//
//  HomeCollectionViewCell.swift
//  
//
//  Created by Riyad Anabtawi on 8/31/15.
//
//

import UIKit
public protocol homeCellDelegate {
    func selectedProfileFromHomeCell(user : User)
    
}
class HomeCollectionViewCell: UICollectionViewCell,UIWebViewDelegate {
    
    @IBOutlet var header: UIView!
    @IBOutlet var footer: UIView!
    var delegate:homeCellDelegate! = nil
    @IBOutlet var webView: UIWebView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var timeSinceLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var applicantsLabel: UILabel!
    @IBOutlet var title_label: UILabel!
    @IBOutlet var description_label: UILabel!
    @IBOutlet var bennefits_label: UILabel!
    @IBOutlet var remuneration_label: UILabel!
    var controller: UIViewController!
    
    var post: Post!
    override func awakeFromNib() {
        
        
        self.userName.font = UIFont(name: FONT_LIGHT, size: self.userName.font.pointSize)
        self.timeSinceLabel.font = UIFont(name: FONT_LIGHT, size: self.timeSinceLabel.font.pointSize)
        
        self.userImage.layer.cornerRadius = self.userImage.frame.size.width/2
        self.userImage.layer.masksToBounds = true
        
        self.remuneration_label.font = UIFont(name: FONT_REGULAR, size: self.remuneration_label.font.pointSize)
        self.title_label.font = UIFont(name: FONT_BOLD, size: self.title_label.font.pointSize)
        self.description_label.font = UIFont(name: FONT_LIGHT, size: self.description_label.font.pointSize)
        self.applicantsLabel.font = UIFont(name: FONT_REGULAR, size: self.applicantsLabel.font.pointSize)
        self.categoryLabel.font = UIFont(name: FONT_REGULAR, size: self.categoryLabel.font.pointSize)
        self.bennefits_label.font = UIFont(name: FONT_REGULAR, size: self.bennefits_label.font.pointSize)


        
    }
    
    func displayJob(job:Post){
    
        self.post = job

        self.userImage.sd_setImageWithURL(NSURL(string: job.user_owner.profilepicture))

        self.userName.text = job.user_owner.user_name
        self.timeSinceLabel.text = job.days_since.stringValue
        
        self.bennefits_label.text = job.post_benefits
        self.title_label.text = job.post_title
        self.categoryLabel.text = job.post_category
        self.applicantsLabel.text = "Applicants \(job.post_likes)"
        
        self.remuneration_label.text = job.post_remuneration
        
        
        if job.hours_since.integerValue <= 0 && job.minutes_since.integerValue <= 0 && job.seconds_since.integerValue > 0{
            
            self.timeSinceLabel.text = "\(job.seconds_since)sec"
            
        }
        
        if job.hours_since.integerValue <= 0 && job.minutes_since.integerValue > 0 && job.seconds_since.integerValue > 0{
            
            self.timeSinceLabel.text = "\(job.minutes_since) min"
            
        }
        
        
        if job.hours_since.integerValue > 0 && job.minutes_since.integerValue > 0 && job.seconds_since.integerValue > 0{
            
            
            
            self.timeSinceLabel.text = "\(job.hours_since) hs"
            
        }
        
        if job.days_since.integerValue > 0 && job.hours_since.integerValue > 0 && job.minutes_since.integerValue > 0 && job.seconds_since.integerValue > 0{
            
            
            
            self.timeSinceLabel.text = "\(job.days_since) days"
            
        }
        
        

        
        
        
    }
    
    
    @IBAction func ShareFacebookTouchUpInside(sender: UIButton) {
        
        
        
    
                let postDescription = self.post.post_description
                
                let fullURL = BASE_URL + "show_post?id=" + self.post.post_id.stringValue
                let imageURL = BASE_URL + self.post.post_image
                
                var content: FBSDKShareLinkContent = FBSDKShareLinkContent()
                content.contentURL =  NSURL(string: fullURL)
                content.contentTitle = postDescription
                content.contentDescription = postDescription
                content.imageURL = NSURL(string: imageURL)
                // Share Dialog
                FBSDKShareDialog.showFromViewController(self.controller, withContent: content, delegate: nil)

        
        
        
        
        
    }
    
    @IBAction func ShareTwitterTouchUpInside(sender: UIButton) {
        
 
        
  
                let defaults = NSUserDefaults.standardUserDefaults()
                if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
                    
                    let string = BASE_URL + "show_post?id=" + self.post.post_id.stringValue
                    let tweetSheet = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                    tweetSheet.setInitialText(self.post.post_description)
                    tweetSheet.addURL(NSURL(string: string))
                    self.controller.presentViewController(tweetSheet, animated: true, completion: nil)
   
                
                    
                    
                }else{
                    var alert = UIAlertController(title: "Ooops!", message: "Tienes que tener una cuenta de twitter instalada. Debes ir a las configuraciones de tu celular y asociar una cuenta twitter.", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    self.controller.presentViewController(alert, animated: true, completion: nil)
                    
        }
    }
    
    
    @IBAction func goToProfileTouchUpInside(sender: UIButton) {
        
     self.delegate.selectedProfileFromHomeCell(self.post.user_owner)
    }
    
}
