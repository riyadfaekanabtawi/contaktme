//
//  Notification.h
//  
//
//  Created by Riyad Anabtawi on 7/25/15.
//
//

#import <Foundation/Foundation.h>
#import "User.h"



@interface Notification : NSObject

@property NSString *notification_created_at;
@property NSString *notification_content;
@property NSNumber *notification_id;
@property NSNumber *notification_recipe_id;
@property User *notification_user;

-(Notification *)initWithDictionary:(NSDictionary *)dictionary;


@end
