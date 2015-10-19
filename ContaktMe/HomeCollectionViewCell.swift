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
    func appliedForJob(post: Post)
}
class HomeCollectionViewCell: UICollectionViewCell,UIWebViewDelegate {
    
    @IBOutlet var header: UIView!
     @IBOutlet weak var  footer: UIView!
    var delegate:homeCellDelegate! = nil
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var timeSinceLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var applicantsLabel: UILabel!
    @IBOutlet weak var title_label: UILabel!
    @IBOutlet weak var description_label: UILabel!
    @IBOutlet weak var bennefits_label: UILabel!
    @IBOutlet weak var remuneration_label: UILabel!
    @IBOutlet weak var icon_apply: UIImageView!
    var controller: UIViewController!
    
    var post: Post!
    override func awakeFromNib() {
        
      self.icon_apply.alpha = 0.5
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
        self.description_label.text = job.post_description
        self.bennefits_label.text = job.post_benefits
        self.title_label.text = job.post_title
        self.categoryLabel.text = job.post_category
        self.applicantsLabel.text = "Applicants \(job.post_likes)"
        
        self.remuneration_label.text = "\(job.post_remuneration) $USD"
        
        
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
    
    
    
    @IBAction func applyForJobTouchUpInside(sender: AnyObject) {
        
        self.delegate.appliedForJob(self.post)
        
        
    }
    
}
