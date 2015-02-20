//
//  ContactListViewCell.h
//  BeepGoosh
//
//  Created by Riyad Anabtawi on 1/11/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//
#import "User.h"
#import <UIKit/UIKit.h>
#import "ContactListViewCell.h"
@protocol ContactListViewCellDelegate <NSObject>
-(void)Sad:(User *)user;

-(void)Happy:(User *)user;
-(void)selectedUser:(User *)user;
@end

@interface ContactListViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cellWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *requestViewWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mainViewWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sadWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *happyWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageMainWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageSecondWidth;
@property (nonatomic,retain) IBOutlet UIImageView *CheckorNot;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelWidth;
@property (nonatomic,retain) IBOutlet UIImageView *happy;
@property (nonatomic,retain) IBOutlet UIImageView *sad;
@property (nonatomic,retain) IBOutlet UIImageView *icon_image;
@property (nonatomic,retain) IBOutlet UIImageView *user_image;
@property (nonatomic,retain) id<ContactListViewCellDelegate> delegate;
@property (nonatomic,retain) IBOutlet UIView *state_view;
@property (nonatomic,retain) IBOutlet UIView *tapView;
@property (nonatomic,retain) IBOutlet UIView *mainView;
@property (nonatomic,retain) IBOutlet UIView *request_view;
@property (nonatomic,retain) IBOutlet UIView *line1;
@property (nonatomic,retain) IBOutlet UIView *line2;
@property (nonatomic,retain) IBOutlet UILabel *userName;
@property (nonatomic,retain) UITapGestureRecognizer *singleFingerTap;
-(void)displayUser:(User *)user;
-(void)displayLabel:(NSString *)label andImage:(NSString *)image;
-(void)displayPrivacy:(NSString *)label andImage:(NSString *)image;
@property (nonatomic,retain) User *user
;
@end
