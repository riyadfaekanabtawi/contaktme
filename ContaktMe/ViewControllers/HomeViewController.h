//
//  HomeViewController.h
//  BeepGoosh
//
//  Created by Riyad Anabtawi on 1/11/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareContactViewController.h"
#import "SBTVProgramPreview.h"
#import "SlideMenuViewController.h"
#import "SettingsViewController.h"
#import "SWRevealViewController.h"
#import <MessageUI/MessageUI.h>
@interface HomeViewController : UIViewController<UINavigationControllerDelegate,SWRevealViewControllerDelegate,SlideMenuViewControllerDelegate,UITextFieldDelegate,SBTVProgramPreviewDelegate,ShareContactDelegate,UITextFieldDelegate>{

  

    
}

@property (nonatomic,retain) NSArray *contacts;
@property (strong, nonatomic) IBOutlet UITextField *emailDestiny;
@property (nonatomic,retain) UIImagePickerController *imagePicker;
@property (nonatomic,retain) IBOutlet UIView *addUserView;
@property (nonatomic,retain) IBOutlet UIView *Dissapear;
@property  BOOL accepted;
@property (nonatomic,retain) IBOutlet UIView *blockUIview;
@property (nonatomic,retain)  User *user;
@end
