//
//  LoginViewController.h
//  LipSync
//
//  Created by SmartBoxTV on 01-06-15.
//  Copyright (c) 2015 SmartBoxTV. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "Functions.h"
#import "LoadingAnimationView.h"
#import "contaktme-Swift.h"
@interface LoginViewController : UIViewController

@property LoadingAnimationView *loader;
@property (nonatomic,retain) IBOutlet UILabel *facebookLabel;
@end
