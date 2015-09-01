//
//  CommentsCell.swift
//  
//
//  Created by Riyad Anabtawi on 7/20/15.
//
//

import UIKit
import QuartzCore
protocol CommentsCellDelegate{
    func selectedComment(comment_user:User)
 
}
class CommentsCell: UITableViewCell {
    
    @IBOutlet var mainView: UIView!

    @IBOutlet var username: UILabel!

    var comentMain:Comment!
    
     var delegate:CommentsCellDelegate! = nil
    
    func useMember(member:Comment) {
        
        
        comentMain=member
    
        
      
          self.username.text = member.comment_owner.custom_name + " " + member.comment_content
        self.username.setTextColor(Functions .colorWithHexString("4A90E2"), beforeOccurenceOfString:member.comment_content)
        
      
        self.username.setFont(UIFont(name: FONT_REGULAR, size: self.username.font.pointSize-1), afterOccurenceOfString: member.comment_owner.custom_name)
        
        self.username.setFont(UIFont(name: FONT_BOLD, size: self.username.font.pointSize), beforeOccurenceOfString: member.comment_content)
   
        
        
        
    }
    
    override func awakeFromNib() {
       
 
    }
    @IBAction func SelectedComment(sender: AnyObject) {
        
 
        
        self.delegate.selectedComment(comentMain.comment_owner)
        
        
        
    }
    
  
    

    
}
