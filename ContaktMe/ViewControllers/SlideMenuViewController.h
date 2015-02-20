//
//  SlideMenuViewController.h
//  ContaktMe
//
//  Created by Riyad Anabtawi on 1/21/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "ContactListViewCell.h"
@protocol SlideMenuViewControllerDelegate <NSObject>
-(void)selectedLogOut;
-(void)ShowSelectedUser:(User *)user;
-(void)SelectedOption:(NSString *)string andContakts:(NSArray *)contacts;
-(void)addNewUser;
-(void)happy:(User *)user;
-(void)sad:(User *)user;
-(void)acceptPendingUser:(User *)user;
-(void)showAddview;
-(void)refusePendingUser:(User *)user;
@end

@interface SlideMenuViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,ContactListViewCellDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mainScrollHeight;

@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIView *adduserView;
@property (weak, nonatomic) IBOutlet UILabel *titleMenu;
@property (weak, nonatomic) IBOutlet UILabel *list;
@property (nonatomic,retain) NSArray *configOptions;
@property (nonatomic,retain) NSArray *configIcons;
@property (nonatomic,retain) IBOutlet UITableView *contactTableView;
@property (nonatomic,retain) IBOutlet UITableView *configTableView;
@property (nonatomic,retain)User *user;
@property (nonatomic,retain) NSMutableDictionary *userDick;
@property (nonatomic,retain)User *usercontact;
@property (nonatomic,retain) NSArray *contacts;
@property (nonatomic,retain) NSArray *contactsPending;
@property (nonatomic,retain) id<SlideMenuViewControllerDelegate> delegate;


@end
