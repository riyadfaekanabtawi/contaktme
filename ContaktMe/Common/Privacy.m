//
//  User.m
//  BeepGoosh
//
//  Created by Riyad Anabtawi on 1/11/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import "Privacy.h"
#import "Functions.h"

@implementation Privacy

-(Privacy *)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        self.name = [dictionary objectForKey:@"name"];
        self.category = [dictionary objectForKey:@"category"];

    }
    
    return self;
}


- (void)encodeWithCoder:(NSCoder *)encoder {
    //TODO: Encode date objects
    
    [encoder encodeObject:self.name forKey:@"name"];
     [encoder encodeObject:self.category forKey:@"category"];
    

}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //TODO: Decode date objects
        self.name = [decoder decodeObjectForKey:@"name"];
        self.category = [decoder decodeObjectForKey:@"category"];
        
    }
    return self;
}
@end