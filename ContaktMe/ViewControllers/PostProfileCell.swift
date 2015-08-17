//
//  PostProfileCell.swift
//  
//
//  Created by Riyad Anabtawi on 7/23/15.
//
//

import UIKit
protocol PostProfileCellDelegate{
    
    func selectedPostFromProfileCell(post:Post)
    
}
class PostProfileCell: UICollectionViewCell {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var ImageView: UIImageView!
    
    var post: Post! = nil
     var delegate:PostProfileCellDelegate! = nil
    override func awakeFromNib() {
        
        
        
        
    }

    func displayPost(post:Post) {
        
        
        self.post = post as Post
        if self.post.post_image.rangeOfString(BASE_URL) != nil{
          
            
        self.ImageView.sd_setImageWithURL(NSURL(string: self.post.post_image))
            
        }else{
          self.ImageView.sd_setImageWithURL(NSURL(string: BASE_URL + self.post.post_image))
        
        
        }
      
        
        
        
    }
    
    @IBAction func selectedPsot(sender: UIButton) {
        
        self.delegate.selectedPostFromProfileCell(post)
        
    }
}
