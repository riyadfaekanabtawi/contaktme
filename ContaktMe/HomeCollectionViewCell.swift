//
//  HomeCollectionViewCell.swift
//  
//
//  Created by Riyad Anabtawi on 8/31/15.
//
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell,UIWebViewDelegate {
    
    @IBOutlet var header: UIView!
    @IBOutlet var footer: UIView!
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
}
