//
//  User.m
//  instapet
//
//  Created by SmartBoxTV on 20-07-15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import "User.h"
#import "Post.h"
@implementation User



-(User *)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        
        self.user_id = [dictionary objectForKey:@"id"];
        self.user_name = [dictionary objectForKey:@"name"];
        self.email = [dictionary objectForKey:@"email"];
        self.user_backDrop = [dictionary objectForKey:@"backdrop_url"];
        if([[dictionary objectForKey:@"image_url"] isKindOfClass:[NSNull class]] || [dictionary objectForKey:@"image_url"]==nil || ![dictionary objectForKey:@"image_url"]){
        self.profilepicture = @"placeholder";
        }else{
            self.profilepicture = replaceNSNullValue([dictionary objectForKey:@"image_url"]);
        }
            self.user_skills = replaceNSNullValue([dictionary objectForKey:@"users_skills"]);
         self.workplace = replaceNSNullValue([dictionary objectForKey:@"workplace"]);
        if(![dictionary objectForKey:@"custom_name"]){
        
        self.custom_name = @"";
            
      
        
        }else{
        self.custom_name = [dictionary objectForKey:@"custom_name"];
        
        }
        self.user_mobile =replaceNSNullValue([dictionary objectForKey:@"telefone"]);
        self.profession = replaceNSNullValue([dictionary objectForKey:@"profession"]);
        NSMutableArray *array =[NSMutableArray new];
        
        for ( NSDictionary *dic in [dictionary objectForKey:@"recipes"]){
            
            
            [array addObject: [[Post alloc] initWithDictionary:dic]];
            
            
        }
        
        self.posts = [NSArray arrayWithArray:array];
        
        
        
        
        
        NSMutableArray *array2 =[NSMutableArray new];
        
        for ( NSDictionary *dic in [dictionary objectForKey:@"friends"]){
            
            
            [array2 addObject: [[User alloc] initWithDictionary:dic]];
            
            
        }
        
        self.friends = [NSArray arrayWithArray:array2];
        
    }
    
    return self;
}


- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.friends forKey:@"user_friends"];
      [coder encodeObject:self.user_id forKey:@"user_id"];
     [coder encodeObject:self.user_name forKey:@"user_name"];
     [coder encodeObject:self.email forKey:@"email"];
[coder encodeObject:self.posts forKey:@"user_posts"];
    
  
}



- (id)initWithCoder:(NSCoder *)aDecoder {
    
self.user_id = [aDecoder decodeObjectForKey:@"user_id"];
    self.user_name = [aDecoder decodeObjectForKey:@"user_name"];
self.friends = [aDecoder decodeObjectForKey:@"user_friends"];
    self.posts = [aDecoder decodeObjectForKey:@"user_posts"];
    self.email = [aDecoder decodeObjectForKey:@"email"];
    
    return self;
}
@end
