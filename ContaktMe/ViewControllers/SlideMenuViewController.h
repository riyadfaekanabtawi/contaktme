//
//  SlideMenuViewController.h
//  ContaktMe
//
//  Created by Riyad Anabtawi on 1/21/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//
#import "contaktme-Swift.h"
#import <UIKit/UIKit.h>
#import "User.h"
#import "ContactListViewCell.h"
@protocol SlideMenuViewControllerDelegate <NSObject>
@optional
-(void)selectedLogOut;

-(void)SelectedOption:(NSString *)string;
-(void)goToSettings;
-(void)addNewUser;
-(void)happy:(User *)user;
-(void)sad:(User *)user;
-(void)acceptPendingUser:(User *)user;
-(void)showAddview;
-(void)backToHome;
-(void)nearbyJobs;
-(void)refusePendingUser:(User *)user;
-(void)vodFilterDisplayThirdLevel:(NSArray *)filter andType:(NSString *)type;
@end

@interface SlideMenuViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,ContactListViewCellDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mainScrollHeight;
@property (retain, nonatomic)    RadarView *radar;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIView *adduserView;
@property (weak, nonatomic) IBOutlet UILabel *titleMenu;
@property (weak, nonatomic) IBOutlet UILabel *list;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *sectionLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeLabel;
@property (weak, nonatomic) IBOutlet UILabel *panelLabel;
@property (weak, nonatomic) IBOutlet UILabel *onlinUsersLabel;
@property (weak, nonatomic) IBOutlet UILabel *pendingLabel;
@property (weak, nonatomic) IBOutlet UILabel *allcontaktsLabel;
@property (weak, nonatomic) IBOutlet UILabel *chatsLabel;
@property (weak, nonatomic) IBOutlet UILabel *privacyLabel;
@property (weak, nonatomic) IBOutlet UILabel *AllProjectsLabel;
@property (weak, nonatomic) IBOutlet UILabel *blockLabel;
@property (weak, nonatomic) IBOutlet UILabel *searchLocationLabel;
@property (weak, nonatomic) IBOutlet UILabel *LogoutLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userAvatar;
@property (weak, nonatomic) IBOutlet UIView *logout;
@property (weak, nonatomic) IBOutlet UIView *blcok;
@property (weak, nonatomic) IBOutlet UIView *home;
@property (weak, nonatomic) IBOutlet UIView *privacy;
@property (weak, nonatomic) IBOutlet UIView *search;
@property (weak, nonatomic) IBOutlet UIView *chats;
@property (weak, nonatomic) IBOutlet UIView *allContacts;
@property (weak, nonatomic) IBOutlet UIView *allProjectsview;
@property (weak, nonatomic) IBOutlet UILabel *nearbyOffersLabel;
@property (weak, nonatomic) IBOutlet UIView *nearbyOffersview;
@property (weak, nonatomic) IBOutlet UIView *pendingRequests;
@property (weak, nonatomic) IBOutlet UIView *onlineUsers;
@property (nonatomic,retain) NSArray *configOptions;
@property (nonatomic,retain) NSArray *configIcons;
@property (nonatomic,retain) IBOutlet UITableView *contactTableView;
@property (nonatomic,retain) IBOutlet UITableView *configTableView;
@property (nonatomic,retain)User *user;
@property (nonatomic,retain) NSMutableDictionary *userDick;
@property (nonatomic,retain) NSMutableDictionary *AlluserDick;
@property (nonatomic,retain)User *usercontact;
@property (nonatomic,retain) NSArray *contacts;
@property (nonatomic,retain) NSArray *contactsPending;
@property (nonatomic,retain) id<SlideMenuViewControllerDelegate> delegate;


@end
