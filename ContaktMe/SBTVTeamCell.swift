//
//  SBTVTeamCell.swift
//  MovistarPeru
//
//  Created by Franklin Cruz on 3/2/15.
//  Copyright (c) 2015 SmartboxTV. All rights reserved.
//

import UIKit
public protocol JobAppDelegate {
    func userAppliedForJob(id : Int)
    
}
public class SBTVTeamCell: UIView {

    @IBOutlet weak var projectImage: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var applyButton: UIButton!
     var delegate:JobAppDelegate! = nil
    
    public class func create() -> SBTVTeamCell {
        
        let nibName = "SBTVTeamCell"
        
        let nib = NSBundle.mainBundle().loadNibNamed(nibName, owner: nil, options: nil)
        
        let view = nib?.first as! SBTVTeamCell
        

        view.titleLabel.font = UIFont (name: FONT_BOLD, size: view.titleLabel.font.pointSize)
        view.authorLabel.font = UIFont (name: FONT_REGULAR, size: view.authorLabel.font.pointSize)
        view.timeLabel.font = UIFont (name: FONT_REGULAR, size: view.timeLabel.font.pointSize)
        view.descriptionLabel.font = UIFont (name: FONT_REGULAR, size: view.descriptionLabel.font.pointSize)
        
        view.mainView.layer.borderColor=Functions .colorWithHexString("f35e46").CGColor
        view.mainView.layer.cornerRadius = 10;
        view.mainView.layer.masksToBounds = true;
        
        view.projectImage.layer.cornerRadius = 10;
        view.projectImage.layer.masksToBounds = true;
        
        view.applyButton.titleLabel!.font = UIFont(name: FONT_BOLD, size: view.applyButton.titleLabel!.font.pointSize)
        view.applyButton.layer.borderColor = Functions.colorWithHexString("f35e45").CGColor
        view.applyButton.layer.borderWidth = 2.0
        view.applyButton.layer.cornerRadius = 2.0
        
        return view
    }
    
     @IBAction func ApplyForJobTouchUpInside(sender: AnyObject) {
        self.delegate.userAppliedForJob(1231231)
        
    }

}
