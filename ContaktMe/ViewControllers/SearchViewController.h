//
//  SearchUserViewController.h
//  ContaktMe
//
//  Created by Riyad Anabtawi on 2/12/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "contaktme-Swift.h"
#import "User.h"
#import "AHCarouselViewController.h"
#import "SWRevealViewController.h"
#import "ContactListViewCell.h"
@interface SearchViewController : UIViewController<SWRevealViewControllerDelegate,ContactListViewCellDelegate,UIAlertViewDelegate,AHCarouselViewControllerDelegate>
@property (retain, nonatomic) IBOutlet UITableView *autocompleteTableView;
@property (weak, nonatomic) IBOutlet UITableView *searchTableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic,strong) NSArray *titulos;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topApplicationViewSender;
@property (nonatomic,strong) NSString *longitude;
@property (nonatomic,strong) NSString *latitude;
@property (nonatomic,strong) User *user;
@property (weak, nonatomic) IBOutlet UIView *radarAnimation;
@property (weak, nonatomic) IBOutlet UIView *drag;
@property (weak, nonatomic) IBOutlet UIView *noProfessionals;
@property (retain, nonatomic)  NSTimer *timer;
@property (retain, nonatomic)    RadarView *radar;
@property (weak, nonatomic) IBOutlet UIView *sendApplication;
@property  BOOL isSearchingProfessionals;

@property  BOOL isSearchingOffers;
@property (weak, nonatomic) IBOutlet UILabel *sorryLabel;
@property (weak, nonatomic) IBOutlet UIButton *retryButton;

@end
