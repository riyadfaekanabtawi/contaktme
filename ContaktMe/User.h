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
@property NSString *user_backDrop;
@property NSString *user_mobile;
@property NSString *profilepicture;
@property NSString *email;
@property NSString *workplace;
@property NSString *profession;
@property NSNumber *user_id;
@property NSString *custom_name;
@property NSString *user_skills;
@property NSArray *posts;
@property NSArray *friends;
-(User *)initWithDictionary:(NSDictionary *)dictionary;
- (void)encodeWithCoder:(NSCoder *)coder;
- (id)initWithCoder:(NSCoder *)aDecoder ;
@end
