//
//  Comment.h
//  instapet
//
//  Created by SmartBoxTV on 20-07-15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
@interface Comment : NSObject

@property NSString *comment_content;
@property NSNumber *comment_id;
@property User *comment_owner;
@property NSNumber *post_id;

-(Comment *)initWithDictionary:(NSDictionary *)dictionary;
@end
