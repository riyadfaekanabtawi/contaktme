//
//  VODFilterLevel3Cell.h
//  EstadioCDF
//
//  Created by SmartboxTV on 18-01-14.
//  Copyright (c) 2014 CDF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
@protocol Lever3Delegate <NSObject>

@optional




@end
@interface VODFilterLevel3Cell : UITableViewCell
@property (nonatomic,retain) id<Lever3Delegate> delegate;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *imageLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *tapView;


@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (nonatomic,retain)  User *user;

-(void)displayData:(User *)filter;
@property (weak, nonatomic) NSArray *mainfilter;


@end
