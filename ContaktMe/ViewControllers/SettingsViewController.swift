//
//  SettingsViewController.swift
//  instapet
//
//  Created by SmartBoxTV on 22-07-15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

import UIKit
import CoreLocation


protocol settingsDelegate{
    func updatedCustomNameFisrtTime()
    func refreshProfile()
     func loggedOut()
}



class SettingsViewController: UIViewController,CLLocationManagerDelegate {

  let locationManager = CLLocationManager()
    
    var cityLocation: String = ""
    @IBOutlet var customNameTextField: UITextField!
    @IBOutlet var biographyTextField: UITextView!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameTextField: UILabel!
    @IBOutlet var titleView: UILabel!
    @IBOutlet var fullName: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var cerrarSesionLabel: UILabel!
    var IsFirstTime = false
    var delegate:settingsDelegate! = nil
    var loader:LoadingAnimationView!
    
    override func viewDidAppear(animated: Bool) {
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error while updating location " + error.localizedDescription)
    }
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: {(placemarks, error)->Void in
            if (error != nil) {
                println("Reverse geocoder failed with error" + error.localizedDescription)
                return
            }
            
            if placemarks.count != 0 {
                let pm = placemarks[0] as! CLPlacemark
                self.displayLocationInfo(pm)
            }else {
                println("Problem with the data received from geocoder")
            }
        })
    }
    
    func displayLocationInfo(placemark: CLPlacemark) {
        
     self.cityLocation = placemark.locality as String
        
        self.locationLabel.text=self.cityLocation
        
        
    }
    
    
    
    override func viewDidLoad() {
        
        self.profileImageView.layer.cornerRadius = 5
        self.profileImageView.layer.masksToBounds = true
        self.customNameTextField.font = UIFont(name: FONT_REGULAR, size: self.customNameTextField.font.pointSize)
        self.nameTextField.font = UIFont(name: FONT_REGULAR, size: self.customNameTextField.font.pointSize)
        self.locationLabel.font = UIFont(name: FONT_REGULAR, size: self.locationLabel.font.pointSize)
        self.cerrarSesionLabel.font = UIFont(name: FONT_REGULAR, size: self.cerrarSesionLabel.font.pointSize)
        self.fullName.font = UIFont(name: FONT_REGULAR, size: self.fullName.font.pointSize)
        self.titleView.font = UIFont(name: FONT_MEDIUM, size: self.titleView.font.pointSize)
     
         let defaults = NSUserDefaults.standardUserDefaults()
        let nameUser = defaults.objectForKey("user_name") as! String
        let customName = defaults.objectForKey("user_custom_name") as! String
         let bio = defaults.objectForKey("user_bio") as! String
        let user_image = defaults.objectForKey("user_image") as! String
        if customName == ""{
            var alert = UIAlertController(title: "Espera!", message: "Tienes que actualizar tu nombre de usuario.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        self.customNameTextField.text = ""
            self.customNameTextField.placeholder = "Actualiza tu nombre de usuario"
        }else{
        self.customNameTextField.text = customName
        }

        
        
        
        if bio == ""{
            var alert = UIAlertController(title: "Espera!", message: "Tienes que actualizar tu biografía.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            self.biographyTextField.text = ""
            self.biographyTextField.text = "Cuenta un poco sobre tí"
        }else{
            self.biographyTextField.text = bio
        }

        self.profileImageView.sd_setImageWithURL(NSURL(string: user_image))
        
        self.nameTextField.text = nameUser
        self.fullName.text = nameUser
     
        
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
  
    
    
    @IBAction func UpdateInfo(sender: UIButton) {
        if(self.customNameTextField.text != "" && self.biographyTextField.text != ""){

            let defaults = NSUserDefaults.standardUserDefaults()
            
                     
            let user_ids = defaults.objectForKey("user_id") as! Int
            
            let user_name = defaults.objectForKey("user_name") as! String
             let user_email = defaults.objectForKey("user_email") as! String
            let user_avatar = defaults.objectForKey("user_image") as! String
            
            
          self.showloader()
//            Services.EditUser(user_ids, name: user_name, image_url: user_avatar, andEmail: user_email, andCustomName: self.customNameTextField.text, andBio: self.biographyTextField.text, withHandler: { (response) -> Void in
//            
//              let customName = response.objectForKey("custom_name") as! String
//                 let bio = response.objectForKey("bio") as! String
//            self.customNameTextField.text = customName
//                self.biographyTextField.text = bio
//               self.delegate.updatedCustomNameFisrtTime()
//             defaults.setObject(bio, forKey: "user_bio")
//            
//            defaults.setObject(customName, forKey: "user_custom_name")
//            defaults.synchronize()
//            
//            self.hideloader()
//            var alert = UIAlertController(title: "Genial!", message: "Actualizaste tu información", preferredStyle: UIAlertControllerStyle.Alert)
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
//            self.customNameTextField.resignFirstResponder()
//            self.biographyTextField.resignFirstResponder()
//            self.presentViewController(alert, animated: true, completion: nil)
//            if self.IsFirstTime {
//           
//            self.navigationController?.popViewControllerAnimated(true)
//            
//            }else{
//            self.delegate.refreshProfile()
//            
//            }
//           
//        }, orErrorHandler: { (err) -> Void in
//              NSLog("FAILED EDITING SERVICE")
//    self.hideloader()
//        })
            
            
        }else{
            

            
        }
        
      
        
        
        
        
    }
    
    
    
    
    @IBAction func LogOutTouchUpInside(sender: UIButton) {
        
        self.delegate.loggedOut()
        
        
        
        
    }
    
    
    @IBAction func GoBack(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
        
        
    }
    
    
    
    
    func showloader(){
        
        self.loader = LoadingAnimationView.new()
        
        self.loader.showWithImage(UIImage(named: "spinner.png"), andMessage: "", inView: self.view)
        self.view.bringSubviewToFront(self.loader)
        
    }
    
    
    func hideloader(){
        
        self.loader.hide()
        
        
    }
}
