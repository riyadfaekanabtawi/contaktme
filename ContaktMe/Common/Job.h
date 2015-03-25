//
//  Job.h
//  contaktme
//
//  Created by Riyad Anabtawi on 3/4/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Job : NSObject


@property NSString *title;
@property NSString *timePosted;
@property NSString *descriptionJob;
@property NSString *jobImage;





-(Job *)initWithDictionary:(NSDictionary *)dictionary;

@end
