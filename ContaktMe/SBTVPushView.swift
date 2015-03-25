//
//  SBTVPushView.swift
//  CDF
//
//  Created by Franklin Cruz on 10/15/14.
//  Copyright (c) 2014 Smartbox TV. All rights reserved.
//

import UIKit


public protocol SBTVPushViewDelegate {
    func pushViewWillClose(id : Int)
    func pushViewIsSelected(id : Int)
}

public class SBTVPushView: UIView {
    
    var action : ((AnyObject?) -> Void)?
    var data : AnyObject?
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    
    class func create() -> SBTVPushView {

        let subviewArray = NSBundle.mainBundle().loadNibNamed("SBTVPushView", owner: self, options: nil)
        
        return subviewArray[0] as SBTVPushView
    }
    
    func setMessageText(text : String) {
        self.messageLabel.text = text
    }
    
    
    @IBAction func selectionButtonTouchUpInside(sender: AnyObject) {
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.frame.origin.y = -65
            }, completion: {(completed : Bool) -> Void in
                self.removeFromSuperview()
                self.action?(self.data)
        })
        
    }
    
    @IBAction func closeButtonTouchUpInside(sender: AnyObject) {
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.frame.origin.y = -65
            }, completion: {(completed : Bool) -> Void in
                self.removeFromSuperview()
            })
        
    }
}
