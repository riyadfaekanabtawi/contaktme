//
//  VODFilterDelegate.h
//  EstadioCDF
//
//  Created by SmartboxTV on 18-01-14.
//  Copyright (c) 2014 CDF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@protocol VODFilterDelegate <NSObject>

@optional
-(void)displayUser:(User *)user;

-(void)vodFilterDisplayThirdLevel:(NSArray *)filter;
-(void)vodFilterHideThirdLevel:(NSArray *)filter;
-(void)vodFilterApplyFilter:(NSArray *)filter;
-(void)displayNearbyJobs;
-(void)userSelectedJob;
-(void)displaySearchJobs;

-(void)displayAlertToAcceptUser:(User *)user;
-(void)displaySearchProf;
-(void)vodFilterDisplayThirdLevelNews:(NSArray *)filter;
-(void)vodFilterHideThirdLevelNews:(NSArray *)filter;
-(void)vodFilterApplyFilterNews:(NSArray *)filter;
@end
