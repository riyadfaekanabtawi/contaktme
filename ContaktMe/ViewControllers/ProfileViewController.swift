//
//  ProfileViewController.swift
//  
//
//  Created by Riyad Anabtawi on 8/22/15.
//
//

import UIKit

class ProfileViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet var user_name: UILabel!
    @IBOutlet var user_posted_jobs_label: UILabel!
    @IBOutlet var user_skills_label: UILabel!
    @IBOutlet var user_email_label: UILabel!
    @IBOutlet var user_profession_label: UILabel!
    @IBOutlet var user_location_label: UILabel!
    @IBOutlet var user_mobile_label: UILabel!
    @IBOutlet var user_workplace_label: UILabel!
    @IBOutlet var user_followers_label: UILabel!
    @IBOutlet var user_points_label: UILabel!
    
    
    var userMain: User!
    var skill_array :[String] = []
    @IBOutlet var user_posts: UILabel!
    @IBOutlet var user_followers: UILabel!
    @IBOutlet var user_points: UILabel!
    @IBOutlet var user_email: UILabel!
    @IBOutlet var user_profession: UILabel!
    @IBOutlet var user_location: UILabel!
    @IBOutlet var user_mobile: UILabel!
    @IBOutlet var user_workplace: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        self.user_name.font = UIFont(name: FONT_REGULAR, size: self.user_name.font.pointSize)
        self.user_posted_jobs_label.font = UIFont(name: FONT_REGULAR, size: self.user_posted_jobs_label.font.pointSize)
        self.user_skills_label.font = UIFont(name: FONT_REGULAR, size: self.user_skills_label.font.pointSize)
        self.user_email_label.font = UIFont(name: FONT_REGULAR, size: self.user_email_label.font.pointSize)
        self.user_profession_label.font = UIFont(name: FONT_REGULAR, size: self.user_profession_label.font.pointSize)
        self.user_location_label.font = UIFont(name: FONT_REGULAR, size: self.user_location_label.font.pointSize)
        self.user_mobile_label.font = UIFont(name: FONT_REGULAR, size: self.user_mobile_label.font.pointSize)
        self.user_workplace_label.font = UIFont(name: FONT_REGULAR, size: self.user_workplace_label.font.pointSize)
        self.user_posts.font = UIFont(name: FONT_REGULAR, size: self.user_posts.font.pointSize)
        self.user_email.font = UIFont(name: FONT_REGULAR, size: self.user_email.font.pointSize)
        self.user_profession.font = UIFont(name: FONT_REGULAR, size: self.user_profession.font.pointSize)
        self.user_location.font = UIFont(name: FONT_REGULAR, size: self.user_location.font.pointSize)
        self.user_mobile.font = UIFont(name: FONT_REGULAR, size: self.user_mobile.font.pointSize)
        self.user_workplace.font = UIFont(name: FONT_REGULAR, size: self.user_workplace.font.pointSize)
        
        self.user_followers.font = UIFont(name: FONT_REGULAR, size: self.user_followers.font.pointSize)
         self.user_points_label.font = UIFont(name: FONT_REGULAR, size: self.user_points_label.font.pointSize)
         self.user_followers_label.font = UIFont(name: FONT_REGULAR, size: self.user_followers_label.font.pointSize)
         self.user_followers.font = UIFont(name: FONT_REGULAR, size: self.user_followers.font.pointSize)
           let defaults = NSUserDefaults.standardUserDefaults()
        
        let user_id = defaults.objectForKey("user_id") as? NSNumber
        Services.getUserInfoWithID(user_id, andHandler: { (response) -> Void in
            
            
        self.userMain = response as! User
        self.user_email.text = self.userMain.email
            
        self.user_name.text = self.userMain.user_name
        self.user_followers.text = String(self.userMain.friends.count)
            
        self.user_posts.text = String(self.userMain.posts.count)
        self.user_mobile.text = self.userMain.user_mobile
            self.user_workplace.text = self.userMain.workplace;
            
        }) { (err) -> Void in
       
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
     let cell = collectionView.dequeueReusableCellWithReuseIdentifier("skills", forIndexPath: indexPath) as! SkillsCollectionViewCell
        let skill = self.skill_array[indexPath.row]
        
        cell.displaycell(skill)
        return cell
        
        
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return self.skill_array.count
    }

    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(self.view.frame.size.width*0.3, 30)
    }


    
     func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
   
}
