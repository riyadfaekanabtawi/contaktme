//
//  ContactsViewController.h
//  ContaktMe
//
//  Created by Riyad Anabtawi on 2/11/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Privacy.h"
#import "ContactListViewCell.h"
@interface PrivacyViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,ContactListViewCellDelegate,UIAlertViewDelegate>


@property (strong, nonatomic) NSArray *privacyOptions;
@property (nonatomic,retain)Privacy *privacy;
@property (strong, nonatomic) IBOutlet UITableView *allPrivacyTable;
@property (nonatomic,retain) NSMutableDictionary *privacyDick;
@end
