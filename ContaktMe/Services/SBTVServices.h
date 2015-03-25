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

+(void)getUsersforUser:(NSNumber *)user AndHandler:(void (^)(id))handler orErrorHandler:(void (^)(NSError *))errorHandler;

+(void)searchNeaLatitude:(NSString *)latitude andLongitude:(NSString *)longitude forUser:(NSNumber *)user_id AndHandler:(void (^)(id))handler orErrorHandler:(void (^)(NSError *))errorHandler;

+(void)getUserCountry:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler;

+(void)registerUserWithEmail:(NSString *)email andPassword:(NSString *)password andLanguage:(NSNumber *)language withAppID:(NSString *)appID AndHandler:(void (^)(id))handler orErrorHandler:(void (^)(NSError *))errorHandler;

+(void)LoginUserWithemail:(NSString *)email andpassword:(NSString *)password AndHandler:(void (^)(id))handler orErrorHandler:(void (^)(NSError *))errorHandler;


+(void)updateBasicInfoWithFullName:(NSString *)full_name andProfession:(NSString *)profession andCellphone:(NSString *)cell_phone forUserID:(NSNumber *)user_id AndHandler:(void (^)(id))handler orErrorHandler:(void (^)(NSError *))errorHandler;


+(void)requestTokenForUser:(NSNumber *)user_id andPassword:(NSString *)password  AndHandler:(void (^)(id))handler orErrorHandler:(void (^)(NSError *))errorHandler;

@end



