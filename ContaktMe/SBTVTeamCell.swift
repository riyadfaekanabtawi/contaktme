//
//  SBTVTeamCell.swift
//  MovistarPeru
//
//  Created by Franklin Cruz on 3/2/15.
//  Copyright (c) 2015 SmartboxTV. All rights reserved.
//

import UIKit

public class SBTVTeamCell: UIView {

    @IBOutlet weak var projectImage: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    public class func create() -> SBTVTeamCell {
        
        let nibName = "SBTVTeamCell"
        
        let nib = NSBundle.mainBundle().loadNibNamed(nibName, owner: nil, options: nil)
        
        let view = nib?.first as SBTVTeamCell
        

        view.titleLabel.font = UIFont (name: "Sansation-Bold", size: view.titleLabel.font.pointSize)
        view.authorLabel.font = UIFont (name: "Sansation-Regular", size: view.authorLabel.font.pointSize)
        view.timeLabel.font = UIFont (name: "Sansation-Regular", size: view.timeLabel.font.pointSize)
        view.descriptionLabel.font = UIFont (name: "Sansation-Regular", size: view.descriptionLabel.font.pointSize)
        
        view.mainView.layer.borderColor=Functions .colorWithHexString("f35e46").CGColor
        view.mainView.layer.cornerRadius = 10;
        view.mainView.layer.masksToBounds = true;
        
        view.projectImage.layer.cornerRadius = 10;
        view.projectImage.layer.masksToBounds = true;
        
        //view.nameLabel.font = UIFont(name: FONT_, size: view.nameLabel.font.pointSize)
       
        return view
    }

}
