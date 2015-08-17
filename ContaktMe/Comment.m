//
//  Comment.m
//  instapet
//
//  Created by SmartBoxTV on 20-07-15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import "Comment.h"

@implementation Comment




-(Comment *)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        
        self.comment_id = [dictionary objectForKey:@"id"];
        User *user = [User new];
        self.comment_owner = [user initWithDictionary:[dictionary objectForKey:@"user"]];
        self.post_id = [dictionary objectForKey:@"recipe_id"];
        self.comment_content = [dictionary objectForKey:@"content"];
        
        
        
    }
    
    return self;
}
@end
