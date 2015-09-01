//
//  FollowingViewController.swift
//
//
//  Created by Riyad Anabtawi on 7/23/15.
//
//

import UIKit

protocol SearchViewControllerDelegate{
    func selectedUserFromSearch(user:User)
    
}



class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UITextFieldDelegate {
    
    @IBOutlet var cancelarLabel: UILabel!
    @IBOutlet var ResultadosLabel: UILabel!
    @IBOutlet var noContent: UILabel!
    @IBOutlet var noContentView: UIView!
      @IBOutlet var searchView: UIView!
     @IBOutlet var searchTextField: UITextField!
    @IBOutlet var resultsCollectionView: UICollectionView!
    @IBOutlet var radarView: UIView!
    var radar: RadarView!
    var following:[User] = []
    var delegate:SearchViewControllerDelegate! = nil
    
    func collectionView(collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int{
            
            
            return self.following.count
            
    }
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int{
        
        
        return 1
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
          let user = self.following[indexPath.row] as User
        
        self.delegate.selectedUserFromSearch(user)
        
        
    }
    
    func collectionView(collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("search",
                forIndexPath: indexPath) as! SearchViewCell
            
            
            let user = self.following[indexPath.row] as User
            
            
            
            cell.displayPost(user)
            
            return cell
            
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
            
            
            
            return CGSizeMake(self.view.frame.size.width, 50)
            
            
    }
    
    
    override func viewDidLoad() {
     
        self.noContentView.hidden=true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.cancelarLabel.font=UIFont(name: FONT_REGULAR, size: self.cancelarLabel.font.pointSize)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        self.ResultadosLabel.font=UIFont(name: FONT_REGULAR, size: self.ResultadosLabel.font.pointSize)
        self.noContent.font=UIFont(name: FONT_REGULAR, size: self.noContent.font.pointSize)
        self.searchView.layer.cornerRadius = 4
        self.searchView.layer.masksToBounds = true
        
    }
    
    
    
    
    func loadFollowing(){
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let user_id = defaults.objectForKey("user_id") as! NSNumber
      
        self.showRadar()
        Services.getSearchForKeyWord(self.searchTextField.text, andHandler: { (response) -> Void in
            
            
            self.following = response as! [User]
            
            if self.following.count == 0{
                self.noContentView.hidden=false
                 self.noContent.text = "No se encontraron resultados a tu busqueda"
                self.resultsCollectionView.hidden = true
            }else{
                self.resultsCollectionView.reloadData()
               self.noContentView.hidden=true
                self.resultsCollectionView.hidden = false
            }
            
           self.hideRadar()
            }) { (err) -> Void in
                
            self.noContent.hidden = false
                self.noContent.text = "Revisa tu conexión a internet"
                
                     self.resultsCollectionView.hidden = true
        }
        
    }
    
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        
            textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
            self.loadFollowing()
        return true
    }
    
    
    
    @IBAction func cancelSearch(sender: UIButton) {
        
        self.searchTextField.text=""
        
        self.searchTextField.resignFirstResponder()
    }
    
    
    func showRadar(){
    
        self.radar = RadarView()
        self.radarView.alpha = 1
        self.radar.startAnimation()
        self.radar.initialSetup()
    
    }
    
    func hideRadar(){
    self.radarView.alpha = 0
    self.radar.removeFromSuperview()
    self.radar = nil
        
    
    }
}
