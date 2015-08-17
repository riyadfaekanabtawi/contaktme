//
//  Post.h
//  instapet
//
//  Created by SmartBoxTV on 20-07-15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//
#import "Comment.h"
#import <Foundation/Foundation.h>
#import "User.h"
@interface Post : NSObject
@property NSString *post_description;
@property NSString *post_image;
@property NSString *post_bennefits;
@property NSString *post_category;
@property NSString *post_title;
@property NSString *post_position;
@property NSString *post_remuneration;
@property NSString *post_location;
@property NSString *post_benefits;
@property NSNumber *post_id;
@property NSNumber *minutes_since;
@property NSNumber *hours_since;
@property NSNumber *seconds_since;
@property NSNumber *days_since;
@property NSNumber *post_likes;
@property Comment *comment;
@property User *user_owner;
@property NSArray *comments;

-(Post *)initWithDictionary:(NSDictionary *)dictionary;
@end
