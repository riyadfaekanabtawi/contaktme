//
//  User.h
//  instapet
//
//  Created by SmartBoxTV on 20-07-15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject <NSCoding>


@property NSString *user_name;
@property NSString *profilepicture;
@property NSString *email;
@property NSNumber *user_id;
@property NSString *custom_name;
@property NSArray *posts;
@property NSArray *friends;
-(User *)initWithDictionary:(NSDictionary *)dictionary;
- (void)encodeWithCoder:(NSCoder *)coder;
- (id)initWithCoder:(NSCoder *)aDecoder ;
@end
