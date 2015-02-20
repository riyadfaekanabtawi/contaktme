//
//  User.h
//  BeepGoosh
//
//  Created by Riyad Anabtawi on 1/11/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property NSString *name;
@property NSString *lastname;
@property NSString *birthPlace;
@property NSString *status_message;
@property NSString *profession;
@property BOOL registered;
@property NSString *telephone;
@property NSString *email;
@property NSString *password;
@property NSString *state;
@property NSString *avatar;
@property NSString *user_id;
@property NSString *address;
@property NSString *accepted;
@property NSString *category;
@property NSString *gender;
@property NSString *city;
@property NSString *accepted_i;
@property NSString *country;
@property NSString *mobilephone;
@property NSString *workplace;
@property NSNumber *followed_by;
@property NSDate *lastTimeRegistered;




-(User *)initWithDictionary:(NSDictionary *)dictionary;

@end
