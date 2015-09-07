//
//  ProfileViewController.swift
//  
//
//  Created by Riyad Anabtawi on 8/22/15.
//
//

import UIKit

class ProfileViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITextFieldDelegate {

    @IBOutlet var user_name: UILabel!
    @IBOutlet var user_posted_jobs_label: UILabel!
    @IBOutlet var user_skills_label: UILabel!
    @IBOutlet var user_email_label: UILabel!
    @IBOutlet var user_profession_label: UILabel!
    @IBOutlet var user_location_label: UILabel!
    @IBOutlet var user_mobile_label: UILabel!
    @IBOutlet var user_workplace_label: UILabel!
    @IBOutlet var updateButtonUIView: UIView!
    @IBOutlet var update_infoLabel: UILabel!
    @IBOutlet var user_followers_label: UILabel!
    @IBOutlet var user_points_label: UILabel!
    @IBOutlet var updateViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet var topUpdateViewConstraintFather: NSLayoutConstraint!
     @IBOutlet var BottomUpdateViewConstraintFather: NSLayoutConstraint!
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
    @IBOutlet var useR_image: UIImageView!
    
    
    @IBOutlet var professionTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var mobileTextField: UITextField!
    @IBOutlet var workplaceTextField: UITextField!
    @IBOutlet var skilsTextField: UITextField!
    
       @IBOutlet var titleUpdate: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.hideUpdateView()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWasShown:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
        self.useR_image.layer.cornerRadius = self.useR_image.frame.size.width/2
        self.titleUpdate.font = UIFont(name: FONT_REGULAR, size: self.titleUpdate.font.pointSize)
        
        self.professionTextField.font = UIFont(name: FONT_LIGHT, size: self.professionTextField.font.pointSize)
        self.workplaceTextField.font = UIFont(name: FONT_LIGHT, size: self.workplaceTextField.font.pointSize)
        self.emailTextField.font = UIFont(name: FONT_LIGHT, size: self.emailTextField.font.pointSize)
        self.mobileTextField.font = UIFont(name: FONT_LIGHT, size: self.mobileTextField.font.pointSize)
        self.skilsTextField.font = UIFont(name: FONT_LIGHT, size: self.skilsTextField.font.pointSize)
        self.updateButtonUIView.layer.cornerRadius = 2
        self.updateButtonUIView.layer.masksToBounds = true
        self.updateButtonUIView.layer.borderWidth = 2
        self.updateButtonUIView.layer.borderColor = UIColor.whiteColor().CGColor
        
        self.useR_image.layer.borderColor = Functions.colorWithHexString("F04531").CGColor
        self.useR_image.layer.borderWidth = 2
        self.useR_image.layer.masksToBounds = true
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
        self.update_infoLabel.font = UIFont(name: FONT_REGULAR, size: self.update_infoLabel.font.pointSize)
        
        self.user_followers.font = UIFont(name: FONT_REGULAR, size: self.user_followers.font.pointSize)
         self.user_points_label.font = UIFont(name: FONT_REGULAR, size: self.user_points_label.font.pointSize)
         self.user_followers_label.font = UIFont(name: FONT_REGULAR, size: self.user_followers_label.font.pointSize)
         self.user_followers.font = UIFont(name: FONT_REGULAR, size: self.user_followers.font.pointSize)
           let defaults = NSUserDefaults.standardUserDefaults()
        
        let user_id = defaults.objectForKey("user_id") as? NSNumber
        Services.getUserInfoWithID(user_id, andHandler: { (response) -> Void in
            
      
        self.userMain = response as! User
        self.user_email.text = self.userMain.email
               self.useR_image.sd_setImageWithURL(NSURL(string: self.userMain.profilepicture))
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
    
    @IBAction func backNAvigationTouchUpInside(sender: UIButton) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    @IBAction func hideUpdateViewTap(sender: UIButton) {
        
        self.hideUpdateView()
    }
    
    @IBAction func updateInfoTuchUpInside(sender: UIButton) {
        
        self.showUpdateView()
    }
    
    
    @IBAction func sendInfoTuchUpInside(sender: UIButton) {
        
  
    }
    
    
    func showUpdateView(){
    
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.topUpdateViewConstraintFather.constant = 0
             self.BottomUpdateViewConstraintFather.constant = 0
            self.view.layoutIfNeeded()
        })
    
    }
    
    
    
    func hideUpdateView(){
        self.professionTextField.resignFirstResponder()
        self.emailTextField.resignFirstResponder()
        self.mobileTextField.resignFirstResponder()
        self.workplaceTextField.resignFirstResponder()
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.topUpdateViewConstraintFather.constant = self.view.frame.size.height
            self.BottomUpdateViewConstraintFather.constant = -self.view.frame.size.height
            self.view.layoutIfNeeded()
        })
    
    
    }
    
    
    
    
    func keyboardWasShown(notification: NSNotification) {
        var info = notification.userInfo!
        var keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.updateViewBottomConstraint.constant = keyboardFrame.size.height
            self.view.layoutIfNeeded()
        })
    }
    
    
    func keyboardWillHide(notification: NSNotification) {
        var info = notification.userInfo!
        var keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.updateViewBottomConstraint.constant = 134
            self.view.layoutIfNeeded()
        })
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == self.professionTextField { // Switch focus to other text field
            self.emailTextField.becomeFirstResponder()
        }else  if textField == self.emailTextField { // Switch focus to other text field
            self.mobileTextField.becomeFirstResponder()
        }else  if textField == self.mobileTextField { // Switch focus to other text field
            self.workplaceTextField.becomeFirstResponder()
        }else  if textField == self.workplaceTextField { // Switch focus to other text field
            textField.resignFirstResponder()
        }
        return true
    }
    
    
}
