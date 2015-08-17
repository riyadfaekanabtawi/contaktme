//
//  Post.m
//  instapet
//
//  Created by SmartBoxTV on 20-07-15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import "Post.h"

@implementation Post{
    NSDateFormatter *dateFormatter;

}



-(Post *)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    
    if (self) {
        
        self.post_id = [dictionary objectForKey:@"id"];
        
       self.post_bennefits = [dictionary objectForKey:@"benefits"];
        self.post_category = [dictionary objectForKey:@"category"];
        self.post_location = [dictionary objectForKey:@"location"];
         self.post_bennefits = [dictionary objectForKey:@"benefits"];
        self.post_remuneration = [dictionary objectForKey:@"remuneration"];
        self.post_position = [dictionary objectForKey:@"position"];
        self.post_likes = replaceNSNullValue([dictionary objectForKey:@"likes"]);
    self.post_title = [dictionary objectForKey:@"title"];
        if (![dictionary objectForKey:@"photo"]){
         
         self.post_image = [NSString stringWithFormat:@"%@assets/recipes/%@/medium/%@",BASE_URL,self.post_id,[dictionary objectForKey:@"photo_file_name"]];
        }else{
         self.post_image = [dictionary objectForKey:@"photo"];
        }
       
        self.post_description = [dictionary objectForKey:@"description"];
        NSDate *dateA = [dateFormatter dateFromString:[dictionary objectForKey:@"created_at"]];
        
        
     
      
        
        self.seconds_since = [NSNumber numberWithInt:fabs([[NSDate date] timeIntervalSinceDate:dateA])];
         self.minutes_since = [NSNumber numberWithInt:fabs([[NSDate date] timeIntervalSinceDate: dateA])/60];
        self.hours_since = [NSNumber numberWithInt:fabs([[NSDate date] timeIntervalSinceDate: dateA])/3600];
        self.days_since = [NSNumber numberWithInt:fabs([[NSDate date] timeIntervalSinceDate: dateA])/86400];
        NSMutableArray *array =[NSMutableArray new];
    
        for ( NSDictionary *dic in [dictionary objectForKey:@"comments"]){
        
     
            [array addObject: [[Comment alloc] initWithDictionary:dic]];
            
        
        }
        
        self.comments = [NSArray arrayWithArray:array];
        User *user = [User new];
        
        self.user_owner = [user initWithDictionary:[dictionary objectForKey:@"user"]];
        
    }
    
    return self;
}


-(BOOL)isEqual:(id)object{

    
    if ([object isKindOfClass:[Post class]]){
     return object==self || [[object post_id] isEqualToNumber:self.post_id];
    
    }else{
        return NO;
    
    }


}
@end
