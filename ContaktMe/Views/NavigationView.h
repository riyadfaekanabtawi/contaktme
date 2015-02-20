//
//  NavigationView.h
//  BeepGoosh
//
//  Created by Riyad Anabtawi on 1/11/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol NavigationDelegate <NSObject>

-(void)showSlideMenu;
-(void)goback;
-(void)showSettings;
@end

@interface NavigationView : UIView


@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;

@property (weak, nonatomic) IBOutlet UIImageView *backicon;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (weak, nonatomic) IBOutlet UIButton *settingsButton;
@property (weak, nonatomic) IBOutlet UIImageView *menuicon;
@property (weak, nonatomic) IBOutlet UIImageView *settingicon;
@property (nonatomic,retain) id<NavigationDelegate> delegate;
+(NavigationView *)create;


-(void)hideback;
-(void)hidemenu;
-(void)hidesettings;
@end
