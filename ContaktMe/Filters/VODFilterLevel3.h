//
//  VODFilterLevel3.h
//  EstadioCDF
//
//  Created by SmartboxTV on 18-01-14.
//  Copyright (c) 2014 CDF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "VODFilterDelegate.h"
#import "VODFilterLevel3Cell.h"



@interface VODFilterLevel3 : UIView<UITableViewDataSource,UITableViewDelegate,Lever3Delegate>

@property (nonatomic,retain) id<VODFilterDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) NSString *type;
@property (nonatomic,retain) NSArray *filter;
@property (nonatomic,retain)  User *user;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height;
+(VODFilterLevel3 *)createWithFilter:(NSArray *)filter andType:(NSString *)type;

@end
