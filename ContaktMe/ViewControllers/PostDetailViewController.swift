//
//  PostDetailViewController.swift
//  
//
//  Created by Riyad Anabtawi on 8/2/15.
//
//


import UIKit
protocol postDetailDelegate{
    func refreshHomeFromPostDetail()
 
    
}
class PostDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var facebookContainer: UIView!
    @IBOutlet var twitterContainer: UIView!
    @IBOutlet var cancelContainer: UIView!
    @IBOutlet var deleteContainer: UIView!
    
    var loader:LoadingAnimationView!
    @IBOutlet var facebookIcon: UIImageView!
    @IBOutlet var twitterIcon: UIImageView!
    @IBOutlet var cancelIcon: UIImageView!
    @IBOutlet var deleteIcon: UIImageView!
    
    
    @IBOutlet var likesLabel: UILabel!
    @IBOutlet var topOptionsViewCopntraint: NSLayoutConstraint!
    @IBOutlet var eliminarHeight: NSLayoutConstraint!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var insertcommentView: UIView!
    @IBOutlet var eliminarFotoView: UIView!
    @IBOutlet var postImageView: UIImageView!
    @IBOutlet var heart_Big: UIImageView!
    @IBOutlet var optionImage: UIImageView!
    @IBOutlet var showInsertcommentButton: UIButton!
    @IBOutlet var optionsView: UIView!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var insertCommentButton: UIButton!
    @IBOutlet var commentTextField: UITextField!
    var post_id: NSNumber!
    @IBOutlet var commentsCollectionView: UICollectionView!
    var post:Post! = nil
    var comment:[Comment] = []
    
       var delegate:postDetailDelegate! = nil
    func collectionView(collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int{
            
            
            return self.comment.count
            
    }
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int{
        
        
        return 1
        
    }
    
    
    
    func collectionView(collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("comments",
                forIndexPath: indexPath) as! CommentsViewCellDetail
            
            
            let comment = self.comment[indexPath.row] as Comment
            
            
            
            cell.showComment(comment)
            
            return cell
            
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
            
            
            
            return CGSizeMake(self.view.frame.size.width, 30)
            
            
    }
    
    internal override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
     }
    override func viewDidLoad() {
        self.optionImage.layer.cornerRadius = 5
        self.optionImage.layer.masksToBounds = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.commentTextField.font=UIFont(name: FONT_MEDIUM, size: self.commentTextField.font.pointSize)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
           self.heart_Big.alpha=0.0
        
         self.descriptionLabel.font=UIFont(name: FONT_REGULAR, size: self.descriptionLabel.font.pointSize)
  
        self.topOptionsViewCopntraint.constant = self.view.frame.size.height;
        self.view.layoutIfNeeded()
        self.insertcommentView.alpha=0
        

        
       

    self.loadFollowing()
       
        
        
    
    }
    
    
    
    
    func loadFollowing(){
    
     
        
        
        
        Services.getRecipeDetailWithID(self.post_id, withHandler: { (response) -> Void in
         
            
            self.post = response as! Post
            self.comment = self.post.comments as! [Comment]
            
            let defaults = NSUserDefaults.standardUserDefaults()
            
            let myID = defaults.objectForKey("user_id") as! NSNumber
            
            
            if self.post.user_owner.user_id.integerValue == myID.integerValue{
                self.eliminarHeight.constant = 50
                
            }else{
                self.eliminarHeight.constant = 0
            }
            
            self.view.layoutIfNeeded()
            self.optionImage.sd_setImageWithURL(NSURL(string: BASE_URL + self.post.post_image))
            self.descriptionLabel.text = self.post.post_description
            self.postImageView.sd_setImageWithURL(NSURL(string: BASE_URL + self.post.post_image))
       
            self.likesLabel.text = self.post.post_likes.stringValue +  " Me gusta"
            self.comment = self.post.comments as! [Comment]
            if self.comment.count == 0{
                
            }else{
                
                
                self.commentsCollectionView.reloadData()
                
            }
            Services.checkLikeForUserWithID(myID, andPost: self.post.post_id, andHandler: { (response) -> Void in
                
                let res = response as! String
                
                
                
                if res == "YES"{
                    
                    self.likeButton.selected = true
                }else{
                    
                    self.likeButton.selected = false
                    
                }
                
                
                }) { (err) -> Void in
                    
                    
                    
            }
            
        }) { (err) -> Void in
          
            
            
            
            
        }
         
        
    }
    
    
    func animateTable (){
        
        let cells = self.commentsCollectionView.visibleCells()
        let tableHeight: CGFloat = self.commentsCollectionView.bounds.size.height
        
        for i in cells {
            let cell: UICollectionViewCell = i as! CommentsViewCellDetail
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UICollectionViewCell = a as! CommentsViewCellDetail
            UIView.animateWithDuration(1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: nil, animations: {
                cell.transform = CGAffineTransformMakeTranslation(0, 0);
                }, completion: nil)
            
            index += 1
        }
        
    }
    
    
    func showOptions(){
    
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.topOptionsViewCopntraint.constant = 0
            self.view.layoutIfNeeded()
        })
    
    }
    
    func hideOptions(){
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.topOptionsViewCopntraint.constant = self.view.frame.height
            self.view.layoutIfNeeded()
        })
        
    }
    
    
    @IBAction func goBack(sender: UIButton) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    @IBAction func showOptionsview(sender: UIButton) {
        
     self.showOptions()
        
    }
    
    
    @IBAction func hideOptionsview(sender: UIButton) {
         self.cancelIcon.transform = CGAffineTransformMakeScale(0.1, 0.1)
        UIView.animateWithDuration(1.0,
            delay: 0,
            usingSpringWithDamping: 0.20,
            initialSpringVelocity: 6.00,
            options: UIViewAnimationOptions.AllowUserInteraction,
            animations: {
                self.cancelIcon.transform = CGAffineTransformIdentity
                
            }, completion: {
                (value: Bool) in
                
             self.hideOptions()
        })
     
        
    }
    
    @IBAction func deletePictureTouchUpInside(sender: UIButton) {
        
         self.deleteIcon.transform = CGAffineTransformMakeScale(0.1, 0.1)
        UIView.animateWithDuration(1.0,
            delay: 0,
            usingSpringWithDamping: 0.20,
            initialSpringVelocity: 6.00,
            options: UIViewAnimationOptions.AllowUserInteraction,
            animations: {
                self.deleteIcon.transform = CGAffineTransformIdentity
                
            }, completion: {
                (value: Bool) in
                
                let defaults = NSUserDefaults.standardUserDefaults()
                
                let myID = defaults.objectForKey("user_id") as! NSNumber
                
                
           self.showloader()
                
                Services.DestroyPostForUser(myID, andPost: self.post_id, withHandler: { (response) -> Void in
                    
                    
                       self.hideloader()
                    self.hideOptions()
                    self.delegate.refreshHomeFromPostDetail()
                    self.navigationController?.popViewControllerAnimated(true)
                    }) { (err) -> Void in
                        
                      self.hideloader()
                        
                }
        })
   
        
        
    }
    
    
    @IBAction func FacebookTouchUpInside(sender: UIButton) {
         self.facebookIcon.transform = CGAffineTransformMakeScale(0.1, 0.1)
        UIView.animateWithDuration(1.0,
            delay: 0,
            usingSpringWithDamping: 0.20,
            initialSpringVelocity: 6.00,
            options: UIViewAnimationOptions.AllowUserInteraction,
            animations: {
                self.facebookIcon.transform = CGAffineTransformIdentity
                
            }, completion: {
                (value: Bool) in
                
                let postDescription = self.post.post_description
                
                let fullURL = BASE_URL + "show_post?id=" + self.post.post_id.stringValue
                let imageURL = BASE_URL + self.post.post_image
                
                var content: FBSDKShareLinkContent = FBSDKShareLinkContent()
                content.contentURL =  NSURL(string: fullURL)
                content.contentTitle = postDescription
                content.contentDescription = postDescription
                content.imageURL = NSURL(string: imageURL)
                // Share Dialog
                FBSDKShareDialog.showFromViewController(self, withContent: content, delegate: nil)
                
                
                self.hideOptions()
        })
        
        
    
        
        
    }
    
    @IBAction func twitterTouchUpInside(sender: UIButton) {
         self.twitterIcon.transform = CGAffineTransformMakeScale(0.1, 0.1)
        UIView.animateWithDuration(1.0,
            delay: 0,
            usingSpringWithDamping: 0.20,
            initialSpringVelocity: 6.00,
            options: UIViewAnimationOptions.AllowUserInteraction,
            animations: {
                self.twitterIcon.transform = CGAffineTransformIdentity
                
            }, completion: {
                (value: Bool) in
                
                let defaults = NSUserDefaults.standardUserDefaults()
                if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
                    
                    let string = BASE_URL + "show_post?id=" + self.post.post_id.stringValue
                    let tweetSheet = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                    tweetSheet.setInitialText(self.post.post_description)
                    tweetSheet.addImage(self.postImageView.image)
                    tweetSheet.addURL(NSURL(string: string))
                    self.presentViewController(tweetSheet, animated: true, completion: nil)
                    self.hideOptions()
                    let nameOrTwitter: String!
                    
                    
                }else{
                    var alert = UIAlertController(title: "Ooops!", message: "Tienes que tener una cuenta de twitter instalada. Debes ir a las configuraciones de tu celular y asociar una cuenta twitter.", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                }
        })
  
 
        
    }
    
    
    
    
    @IBAction func commentPost(sender: AnyObject) {
        self.showInsertcommentButton.transform = CGAffineTransformMakeScale(0.1, 0.1)
        
        UIView.animateWithDuration(2.0,
            delay: 0,
            usingSpringWithDamping: 0.20,
            initialSpringVelocity: 6.00,
            options: UIViewAnimationOptions.AllowUserInteraction,
            animations: {
                self.showInsertcommentButton.transform = CGAffineTransformIdentity
            }, completion: nil)
        UIView.animateWithDuration(0.8, animations: {
            
            self.insertcommentView.alpha=1
            
            }, completion: {
                (value: Bool) in
                
                
        })
        
        
    }
    
    
    
    
    
    @IBAction func sendPost(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let user_id = defaults.objectForKey("user_id") as! Int
        self.insertCommentButton.transform = CGAffineTransformMakeScale(0.1, 0.1)
        
        UIView.animateWithDuration(2.0,
            delay: 0,
            usingSpringWithDamping: 0.20,
            initialSpringVelocity: 6.00,
            options: UIViewAnimationOptions.AllowUserInteraction,
            animations: {
                self.insertCommentButton.transform = CGAffineTransformIdentity
            }, completion: nil)
        
        if (self.commentTextField.text != ""){
       self.showloader()
            Services.PostCommentByUser(user_id, forRecipe: self.post_id, withContent: self.commentTextField.text, withHandler: { (response) -> Void in
                
                self.commentTextField.text = ""
                UIView.animateWithDuration(0.8, animations: {
                       self.loadFollowing()
                    self.insertcommentView.alpha = 0.0
                    self.commentTextField.resignFirstResponder()
                self.delegate.refreshHomeFromPostDetail()
                    }, completion: {
                        (value: Bool) in
                        
                        
                })
                          self.hideloader()
                }, orErrorHandler: { (err) -> Void in
                    
                              self.hideloader()
                    NSLog("FAILED POST COMMENT SERVICE")
                    
            })
            
        }else{
            
            
            
        }
        
        
    }
    
    @IBAction func selectedFav(sender: AnyObject) {
        
        
        //  if self.favorite_button.selected == false {
        
        self.likeButton.selected = true
        
        self.likeButton.transform = CGAffineTransformMakeScale(0.1, 0.1)
        
        UIView.animateWithDuration(2.0,
            delay: 0,
            usingSpringWithDamping: 0.20,
            initialSpringVelocity: 6.00,
            options: UIViewAnimationOptions.AllowUserInteraction,
            animations: {
                self.likeButton.transform = CGAffineTransformIdentity
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
            
   
            
            }, completion: {
                (value: Bool) in
                
                UIView.animateWithDuration(0.6, animations: {
                    self.heart_Big.transform = CGAffineTransformConcat(scale2,translate2);
                    self.heart_Big.alpha=0.0
                    }, completion: {
                        (value: Bool) in
                        self.heart_Big.transform = CGAffineTransformConcat(scale,translate);
                        
                        Services.LikePost(self.post_id, byUser: user_id, withHandler: { (response) -> Void in
                            
                            
                            //            let responseString = response.objectForKey("Result") as! String
                            //
                            //            if responseString == "Liked"{
                            //                UIView.animateWithDuration(0.6, animations: {
                            //                    self.heart_Big.transform = CGAffineTransformIdentity
                            //                    self.heart_Big.alpha=1.0
                            //
                            //                    self.likesHeight.constant=20
                            //                    self.layoutIfNeeded()
                            //                    }, completion: {
                            //                        (value: Bool) in
                            //
                            //                        UIView.animateWithDuration(0.6, animations: {
                            //                            self.heart_Big.transform = CGAffineTransformConcat(scale2,translate2);
                            //                            self.heart_Big.alpha=0.0
                            //                            }, completion: {
                            //                                (value: Bool) in
                            //                                self.heart_Big.transform = CGAffineTransformConcat(scale,translate);
                            //
                            //
                            //                        })
                            //
                            //                })
                            //
                            //
                            //            }else{
                            //
                            //
                            //
                            //
                            //            }
                            
                            
                            
                            
                            
                               self.loadFollowing()
                            
                            self.delegate.refreshHomeFromPostDetail()
                            
                            }, orErrorHandler: { (err) -> Void in
                                
                               self.delegate.refreshHomeFromPostDetail()
                                
                                
                        })
                })
                
        })
        
        
        
        
        
        
        
        
        
        
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
