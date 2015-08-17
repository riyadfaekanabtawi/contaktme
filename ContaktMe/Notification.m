//
//  Notification.m
//  
//
//  Created by Riyad Anabtawi on 7/25/15.
//
//

#import "Notification.h"

@implementation Notification{
    NSDateFormatter *dateFormatter;
    
}




-(Notification *)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        
        self.notification_id = [[dictionary objectForKey:@"trackable"] objectForKey:@"id"];
        self.notification_content = [[dictionary objectForKey:@"trackable"] objectForKey:@"content"];
        self.notification_recipe_id = [[dictionary objectForKey:@"trackable"] objectForKey:@"recipe_id"];
        self.notification_created_at = [[dictionary objectForKey:@"trackable"] objectForKey:@"created_at"];
        self.notification_user = [[User alloc] initWithDictionary:[dictionary objectForKey:@"owner"]];
        return self;
    }
      return self;
}


@end

