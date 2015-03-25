//
//  Job.m
//  ContaktMe
//
//  Created by Riyad Anabtawi on 1/11/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import "Job.h"
#import "Functions.h"

@implementation Job

-(Job *)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        self.title = [dictionary objectForKey:@"title"];
         self.jobImage = [dictionary objectForKey:@"image"];
         self.descriptionJob = [dictionary objectForKey:@"description"];
         self.timePosted = [dictionary objectForKey:@"created_at"];
    }
    
    return self;
}


- (void)encodeWithCoder:(NSCoder *)encoder {
    //TODO: Encode date objects
    
    [encoder encodeObject:self.title forKey:@"title"];
    [encoder encodeObject:self.jobImage forKey:@"image"];
    [encoder encodeObject:self.descriptionJob forKey:@"description"];
    [encoder encodeObject:self.timePosted forKey:@"created_at"];
   
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //TODO: Decode date objects

        
        self.title = [decoder decodeObjectForKey:@"title"];
        self.jobImage = [decoder decodeObjectForKey:@"image"];
        self.descriptionJob = [decoder decodeObjectForKey:@"description"];
        self.timePosted = [decoder decodeObjectForKey:@"created_at"];
    }
    return self;
}
@end