//
//  ContactsViewController.h
//  ContaktMe
//
//  Created by Riyad Anabtawi on 2/11/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBTVProgramPreview.h"
#import "User.h"
#import "ContactListViewCell.h"
@interface ContactsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,ContactListViewCellDelegate,SBTVProgramPreviewDelegate>


@property (strong, nonatomic) NSArray *contacts;
@property (nonatomic,retain)User *user;
@property (strong, nonatomic) IBOutlet UITableView *allContaktsTable;
@property (nonatomic,retain) NSMutableDictionary *userDick;
@end
