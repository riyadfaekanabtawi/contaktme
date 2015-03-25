//
//  SBTVPushDisplay.swift
//  CDF
//
//  Created by Franklin Cruz on 10/15/14.
//  Copyright (c) 2014 Smartbox TV. All rights reserved.
//

import Foundation
import UIKit

@objc public class SBTVPushDisplay {
    
    class func displayMessage(message : String, messageData : AnyObject, action : (AnyObject?) -> Void) {
        
        let messageView = SBTVPushView.create()
        messageView.action = action
        messageView.data = messageData
        
        messageView.frame.origin.y = -65
        messageView.frame.size.height = 65
        
        messageView.setMessageText(message)
        
        if let frontWindow = UIApplication.sharedApplication().keyWindow {
            frontWindow.subviews[0].addSubview(messageView)


                  
            NSLog("Window Count %@", frontWindow.subviews);
        }
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            messageView.frame.origin.y = 0
        })
    }
    
}