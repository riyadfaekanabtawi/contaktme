//
//  SearchUserViewController.h
//  ContaktMe
//
//  Created by Riyad Anabtawi on 2/12/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "User.h"
#import "ContactListViewCell.h"
@interface SearchUserViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,ContactListViewCellDelegate,UIAlertViewDelegate>
@property (retain, nonatomic) IBOutlet UITableView *autocompleteTableView;
@property (weak, nonatomic) IBOutlet UITableView *searchTableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic,strong) NSArray *titulos;
@property (nonatomic,strong) User *user;
@property (retain, nonatomic)  NSTimer *timer;
@end
