//
//  SBTVServices.h
//  CDF
//
//  Created by Franklin Cruz on 9/4/14.
//  Copyright (c) 2014 Smartbox TV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONServiceParser.h"
@interface SBTVServices : NSObject




+ (void)getWsUrl:(NSString *)pathWS sucess:(void (^) (id responseObject)) completion failure:(void (^) (NSError *error))failure;
+ (void)getWsUrl:(NSString *)pathWS sucess:(void (^) (id responseObject)) completion failure:(void (^) (NSError *error))failure withTryCount:(NSInteger)tries;

+ (void)getWsUrl:(NSString *)pathWS params:(NSString *)p sucess:(void (^) (id responseObject)) completion failure:(void (^) (NSError *error))failure;
+ (void)getWsUrl:(NSString *)pathWS params:(NSString *)p sucess:(void (^) (id responseObject)) completion failure:(void (^) (NSError *error))failure withTryCount:(NSInteger)tries;
+ (NSString *)getWS:(NSString *)name;


+(void)getUserCountry:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler;

@end



