//
//  CommentsViewCellDetail.swift
//  
//
//  Created by Riyad Anabtawi on 8/2/15.
//
//

import UIKit

class CommentsViewCellDetail: UICollectionViewCell {

    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var username: UILabel!
    
    var comentMain:Comment!
    
    var delegate:CommentsCellDelegate! = nil

    
    func showComment(member:Comment) {
        
        
        comentMain=member
        
        
        
        self.username.text = member.comment_owner.custom_name + " " + member.comment_content
        self.username.setTextColor(Functions .colorWithHexString("4A90E2"), beforeOccurenceOfString:member.comment_content)
        
        
        self.username.setFont(UIFont(name: FONT_REGULAR, size: self.username.font.pointSize-2), afterOccurenceOfString: member.comment_owner.custom_name)
        
        self.username.setFont(UIFont(name: FONT_BOLD, size: self.username.font.pointSize), beforeOccurenceOfString: member.comment_content)
        
        
        
        
    }
    
    override func awakeFromNib() {
        
        
    }
}
