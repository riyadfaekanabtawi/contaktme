//
//  Services.h
//  LipSync
//
//  Created by SmartBoxTV on 15-06-15.
//  Copyright (c) 2015 SmartBoxTV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONServiceParser.h"
#import "Post.h"
@interface Services : NSObject




+(void)LoginWithName:(NSString *)name andPassword:(NSString *)password WithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler;


+(void)RegisterWithNAme:(NSString *)name andEmail:(NSString *)email andImageURL:(NSString *)image_url andPassword:(NSString *)password andpasswordConfirmation:(NSString *)password_confirmation andUserID:(NSNumber *)user_id WithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler;

+(void)PostforUser:(NSNumber *)user_id andTitle:(NSString *)title andDescr:(NSString *)descr andRemuneration:(NSString *)remuneration andCategory:(NSString *)category andLocation:(NSString *)location andPosition:(NSString *)position andBenefits:(NSString *)benefits WithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler;



+(void)PostCommentByUser:(NSNumber *)user_id forRecipe:(NSNumber *)recipe_id withContent:(NSString *)content WithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler;


+(void)getAllRecipesWithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler;


+(void)EditUser:(NSNumber *)user_id name:(NSString *)user_name image_url:(NSString *)image_url andEmail:(NSString *)email andCustomName:(NSString *)custom_name andBio:(NSString *)biography WithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler;


+(void)getUserInfoWithID:(NSNumber *)user_id andHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler;

+(void)getFollowingForUserInfoWithID:(NSNumber *)user_id andHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler;

+(void)getActivityForUserInfoWithID:(NSNumber *)user_id andHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler;
+(void)addFriendVictim:(NSNumber *)victim_id fromAttacker:(NSNumber *)attacker_id WithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler;
+(void)removeFriendVictim:(NSNumber *)victim_id fromAttacker:(NSNumber *)attacker_id WithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler;

+(void)DestroyPostForUser:(NSNumber *)user_id andPost:(NSNumber *)post_id WithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler;

+(void)DestroyCommentForUser:(NSNumber *)user_id andComment:(NSNumber *)comment_id WithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler;


+(void)DislikePost:(NSNumber *)post_id byUser:(NSNumber *)user_id WithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler;


+(void)LikePost:(NSNumber *)post_id byUser:(NSNumber *)user_id WithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler;


+(void)getSearchForKeyWord:(NSString *)keyword andHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler;

+(void)getRecipeDetailWithID:(NSNumber *)recipe_id WithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler;


+(void)getFavsForUserWithID:(NSNumber *)user_id andHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler;


+(void)checkLikeForUserWithID:(NSNumber *)user_id andPost:(NSNumber *)post_id andHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler;
@end
