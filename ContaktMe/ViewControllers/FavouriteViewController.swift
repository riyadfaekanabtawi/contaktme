//
//  FavouriteViewController.swift
//  instapet
//
//  Created by Riyad Anabtawi on 29-07-15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//


import UIKit

class FavouriteViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    

    var refreshControl: UIRefreshControl!
    @IBOutlet var noContent: UILabel!
    var post_id: NSNumber!
    @IBOutlet var favsCollectionView: UICollectionView!
    
    var favs:[Post] = []
    
    
    func collectionView(collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int{
            
            
            return self.favs.count
            
    }
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int{
        
        
        return 1
        
    }
    
    
    
    func collectionView(collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("favoritos",
                forIndexPath: indexPath) as! PostProfileCell
            
            

            let post = self.favs[indexPath.row] as Post
            
            
            
            cell.displayPost(post)
            
            return cell
            
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
            
            
            var value1 : CGFloat = 0.330
            
            return CGSizeMake(self.view.frame.size.width * value1, self.view.frame.size.width*value1)
            
            
    }
  
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let post = self.favs[indexPath.row] as Post
        
        self.post_id = post.post_id
        self.performSegueWithIdentifier("showPost", sender: self)
        
        
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1
    }
    
    override func viewDidLoad() {
        self.noContent.hidden = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)

        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        
        self.noContent.font=UIFont(name: FONT_REGULAR, size: self.noContent.font.pointSize)
        self.loadFollowing()
        self.refreshControl = UIRefreshControl()
       // self.refreshControl.attributedTitle = NSAttributedString(string: "refrescando tus favoritos")
        self.refreshControl.addTarget(self, action: "loadFollowing", forControlEvents: UIControlEvents.ValueChanged)
        self.favsCollectionView.addSubview(refreshControl)
    }
    
    
    
    
    func loadFollowing(){
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let user_id = defaults.objectForKey("user_id") as! NSNumber
        
        Services.getFavsForUserWithID(user_id, andHandler: { (response) -> Void in
            
            
            self.favs = response as! [Post]

            if self.favs.count == 0{
                self.noContent.hidden = false
                self.favsCollectionView.hidden = true
            }else{
                self.favsCollectionView.reloadData()
                self.noContent.hidden = true
                self.favsCollectionView.hidden = false
            }
            self.refreshControl.endRefreshing()
            
            }) { (err) -> Void in
                self.noContent.hidden = false
                self.favsCollectionView.hidden = true
                self.noContent.text = "Revisa tu conexión a internet."
                self.refreshControl.endRefreshing()
                
                
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == "showPost"{
        
        let controller = segue.destinationViewController as! PostDetailViewController
            controller.post_id = self.post_id
        
        }
    }
    
    
}
