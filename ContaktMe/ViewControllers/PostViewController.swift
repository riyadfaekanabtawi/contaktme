//
//  PostViewController.swift
//  instapet
//
//  Created by SmartBoxTV on 21-07-15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

import UIKit
protocol PostDelegate{
    func postedImage()
}
class PostViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var postImage: UIImageView!
    @IBOutlet var postDescription: UITextField!
    @IBOutlet var usernameLabel: UILabel!
     @IBOutlet var publicTitle: UILabel!
    @IBOutlet var shareFacebookButton: UIButton!
 
      @IBOutlet var yes_no: UILabel!
     @IBOutlet var publishView: UIView!
     @IBOutlet var compartir_facebook: UILabel!
    @IBOutlet var publicar_label: UILabel!
    @IBOutlet var userAvatar: UIImageView!
    @IBOutlet var image: UIImage!
      var delegate:PostDelegate! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
         let defaults = NSUserDefaults.standardUserDefaults()
        self.compartir_facebook.font = UIFont(name: FONT_REGULAR, size: self.compartir_facebook.font.pointSize)
        self.postDescription.font = UIFont(name: FONT_REGULAR, size: self.postDescription.font.pointSize)
        self.publicTitle.font=UIFont(name: FONT_MEDIUM, size: self.publicTitle.font.pointSize)
        
        self.usernameLabel.font = UIFont(name: FONT_MEDIUM, size: self.usernameLabel.font.pointSize)
        
          self.screenView("Sección post")
        let imageString = defaults.objectForKey("user_image") as! String
        self.userAvatar.sd_setImageWithURL(NSURL(string: imageString))
        self.publicar_label.font = UIFont(name: FONT_MEDIUM, size: self.publicar_label.font.pointSize)
        let user_name = defaults.objectForKey("user_custom_name") as? String
        self.usernameLabel.text = user_name?.lowercaseString
        
        self.publishView.layer.cornerRadius = 3
        self.publishView.layer.masksToBounds = true
        
        self.userAvatar.layer.cornerRadius = 5
        self.userAvatar.layer.masksToBounds = true
        self.yes_no.font = UIFont(name: FONT_MEDIUM, size: self.yes_no.font.pointSize)
        self.postImage.image=self.image;
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func CreatePost(sender: UIButton) {
        
        self.publishView.transform = CGAffineTransformMakeScale(0.1, 0.1)
        
        UIView.animateWithDuration(2.0,
            delay: 0,
            usingSpringWithDamping: 0.20,
            initialSpringVelocity: 6.00,
            options: UIViewAnimationOptions.AllowUserInteraction,
            animations: {
                self.publishView.transform = CGAffineTransformIdentity
            }, completion: nil)
        
        
 
        if self.postDescription.text == "" {
        
            var alert = UIAlertController(title: "Ooops", message: "No puedes dejar la descripción vacía.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        
        
        }else{
        
            let loader  = SBTVLoaderView.create()
            let frontView = UIApplication.sharedApplication().keyWindow
            
            
            let window = UIApplication.sharedApplication().keyWindow
            if let sub =   window?.subviews[0] as? UIView{
                
                Functions.fillContainerView(sub, withView: loader)
                
            }
            
            var imageData = UIImageJPEGRepresentation(self.postImage.image, 0.1)
            let base64String = imageData.base64EncodedStringWithOptions(.allZeros)
            let defaults = NSUserDefaults.standardUserDefaults()
            
            if(self.yes_no.text=="SI"){
        
             
                    let defaults = NSUserDefaults.standardUserDefaults()
                    
                    let user_ids = defaults.objectForKey("user_id") as! NSNumber
                
                
                
                
            }else{
                
        
                
                
                
                
            }
            

        }
        

  
        
        
        
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
  
    
    @IBAction func goBack(sender: UIButton) {

        
        self.navigationController?.popViewControllerAnimated(true)
        
    }

    @IBAction func shareFacebook(sender: UIButton) {
        
        
        if self.shareFacebookButton.selected == false{
        self.shareFacebookButton.selected = true
            self.yes_no.text="NO"
        
        }else{
         self.shareFacebookButton.selected = false
        self.yes_no.text="SI"
        
        }
        
    }
    
    
    
    func screenView(screen: String) {
        
        let tracker  = GAI.sharedInstance().defaultTracker
        tracker.set(kGAIScreenName, value:screen)
        var build = GAIDictionaryBuilder.createScreenView().build() as [NSObject : AnyObject]
        tracker.send(build)
        
    }
}
