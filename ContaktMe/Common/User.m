//
//  User.m
//  BeepGoosh
//
//  Created by Riyad Anabtawi on 1/11/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import "User.h"
#import "Functions.h"

@implementation User

-(User *)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        self.user_id = [dictionary objectForKey:@"id"];
        self.email = [dictionary objectForKey:@"email"];
        self.name = [dictionary objectForKey:@"first_name"];
        self.lastname = [dictionary objectForKey:@"last_name"];
       // self.birthDate = [Functions stringToDate:[dictionary objectForKey:@"birth_date"]];
        self.avatar = [dictionary objectForKey:@"picture_path"];
        self.address = [dictionary objectForKey:@"address"];
        self.country = [dictionary objectForKey:@"country"];
        self.state = [dictionary objectForKey:@"state"];
        self.city = [dictionary objectForKey:@"city"];
        self.telephone = [dictionary objectForKey:@"phone_fixed"];
        self.mobilephone = [dictionary objectForKey:@"phone_mobile"];
        self.gender = [dictionary objectForKey:@"genre"];
        self.lastTimeRegistered = [Functions stringToDate:[dictionary objectForKey:@"period_end_date"]];
        self.registered = [[dictionary objectForKey:@"is_active"] boolValue];
        self.state = [dictionary objectForKey:@"status"];
        self.followed_by = [dictionary objectForKey:@"followed_by"];
         self.status_message = [dictionary objectForKey:@"status_msg"];
         self.birthPlace = [dictionary objectForKey:@"birth_place"];
    }
    
    return self;
}


- (void)encodeWithCoder:(NSCoder *)encoder {
    //TODO: Encode date objects
    
    [encoder encodeObject:self.user_id forKey:@"id"];

    [encoder encodeObject:self.email forKey:@"email"];
    [encoder encodeObject:self.name forKey:@"first_name"];
    [encoder encodeObject:self.lastname forKey:@"last_name"];
    //[encoder encodeObject:self.birthDate forKey:@"birth_date"];
    [encoder encodeObject:self.avatar forKey:@"picture_path"];

    [encoder encodeObject:self.address forKey:@"address"];
    [encoder encodeObject:self.country forKey:@"country"];
    [encoder encodeObject:self.state forKey:@"state"];
    [encoder encodeObject:self.city forKey:@"city"];
    [encoder encodeObject:self.telephone forKey:@"phone_fixed"];
    [encoder encodeObject:self.mobilephone forKey:@"phone_mobile"];

    [encoder encodeObject:self.gender forKey:@"genre"];
    [encoder encodeObject:self.lastTimeRegistered forKey:@"period_end_date"];
    [encoder encodeBool:self.registered forKey:@"is_active"];
    [encoder encodeObject:self.state forKey:@"status"];

    
    [encoder encodeObject:self.password forKey:@"password"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //TODO: Decode date objects
        self.user_id = [decoder decodeObjectForKey:@"id"];
           self.email = [decoder decodeObjectForKey:@"email"];
        self.name = [decoder decodeObjectForKey:@"first_name"];
        self.lastname = [decoder decodeObjectForKey:@"last_name"];
        //self.birthDate = [decoder decodeObjectForKey:@"birth_date"];
        self.avatar = [decoder decodeObjectForKey:@"picture_path"];
     
        self.address = [decoder decodeObjectForKey:@"address"];
        self.country = [decoder decodeObjectForKey:@"country"];
        self.state = [decoder decodeObjectForKey:@"state"];
        self.city = [decoder decodeObjectForKey:@"city"];
        self.telephone = [decoder decodeObjectForKey:@"phone_fixed"];
        self.mobilephone = [decoder decodeObjectForKey:@"phone_mobile"];
        self.gender = [decoder decodeObjectForKey:@"genre"];
        self.lastTimeRegistered = [decoder decodeObjectForKey:@"period_end_date"];
        self.registered = [decoder decodeBoolForKey:@"is_active"];
        self.state = [decoder decodeObjectForKey:@"status"];
        
        self.password = [decoder decodeObjectForKey:@"password"];
    }
    return self;
}
@end