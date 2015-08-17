//
//  Services.m
//  InstaPet
//
//  Created by InstaPet on 15-06-15.
//  Copyright (c) 2015 InstaPet. All rights reserved.
//

#import "Services.h"
#import "SBTVCustomAlertView.h"
#import "Notification.h"
#import "Functions.h"

#import "SBTVLoaderView.h"
#import "AFHTTPRequestOperationManager.h"
@implementation Services






+(void)LoginWithName:(NSString *)name andPassword:(NSString *)password WithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler{
    
    
    
    SBTVLoaderView *loader = [SBTVLoaderView create];
    
    
    UIWindow *frontWindow = [[UIApplication sharedApplication] keyWindow];
    
    [Functions fillContainerView:frontWindow.subviews[0] WithView:loader];
    
    

    
    NSDictionary *parameters = @{@"name" :name,@"password" :password};
    
  
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  
    
    manager.securityPolicy.allowInvalidCertificates = YES;

    
    [manager POST:[NSString stringWithFormat:@"%@user/login",BASE_URL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        

        handler([responseObject objectForKey:@"User"]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        errorHandler(error);
        
        [loader endAnimation];
        [loader removeFromSuperview];
    }];
    
    
    
}



+(void)RegisterWithNAme:(NSString *)name andEmail:(NSString *)email andImageURL:(NSString *)image_url andPassword:(NSString *)password andpasswordConfirmation:(NSString *)password_confirmation andUserID:(NSNumber *)user_id WithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler{
    
    
    
    
    NSDictionary *parameters = @{@"user":@{@"name" :name,@"email" :email,@"image_url" :image_url,@"password" :image_url,@"id" :user_id,@"password" :@"121788gloriA",@"password_confirmation" :@"121788gloriA",@"created_at" :[NSDate date],@"updated_at" :[NSDate date]}};

    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    
    [manager POST:[NSString stringWithFormat:@"%@user/register",BASE_URL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        
        
        handler(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        errorHandler(error);
        
       
    }];
    
    
    
}
+(void)getAllRecipesWithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler{

    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@recipe/list",BASE_URL]];
    
    
    [[[JSONServiceParser alloc] init] getJSONFromUrl:url withHandler:^(id streamsData) {
  
        NSMutableArray *array = [NSMutableArray new];
        
        for (NSDictionary *dic in streamsData){
            [array addObject:[[Post alloc] initWithDictionary:dic]];
        
        
        }
        
        
        handler(array);
        
    } orErrorHandler:^(NSError *err) {
        
        errorHandler(err);
        
        
    }];




}







+(void)PostforUser:(NSNumber *)user_id andTitle:(NSString *)title andDescr:(NSString *)descr andRemuneration:(NSString *)remuneration andCategory:(NSString *)category andLocation:(NSString *)location andPosition:(NSString *)position andBenefits:(NSString *)benefits WithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler{
    
    int i = arc4random() % 1000;
    NSNumber *number = [NSNumber numberWithInt:i];
    
    NSDictionary *parameters = @{@"user":@{@"id" :user_id},@"recipe":@{@"id" :number,@"created_at" :[NSDate date],@"updated_at" :[NSDate date],@"title" :title,@"description" :descr,@"position" :position,@"remuneration" :remuneration,@"category" :category,@"location":location,@"benefits":benefits}};
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    
    [manager POST:[NSString stringWithFormat:@"%@recipe/create",BASE_URL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        
        
        handler([responseObject objectForKey:@"Post"]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        errorHandler(error);
        
        
    }];
    
    
    
}




+(void)PostCommentByUser:(NSNumber *)user_id forRecipe:(NSNumber *)recipe_id withContent:(NSString *)content WithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler{
    
    int i = arc4random() % 1000;
    NSNumber *number = [NSNumber numberWithInt:i];
    
    NSDictionary *parameters = @{@"user_posting":@{@"id" :user_id},@"recipe_commented":@{@"id" :recipe_id},@"comment":@{@"id" :number,@"content" :content,@"recipe_id" :recipe_id,@"created_at" :[NSDate date],@"updated_at" :[NSDate date]}};
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    
    [manager POST:[NSString stringWithFormat:@"%@comment/create",BASE_URL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        
        Post *recipe  = [[Post alloc] initWithDictionary:responseObject];
        
        
        handler(recipe);
  
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        errorHandler(error);
        
        
    }];
    
    
    
}




+(void)EditUser:(NSNumber *)user_id name:(NSString *)user_name image_url:(NSString *)image_url andEmail:(NSString *)email andCustomName:(NSString *)custom_name andBio:(NSString *)biography WithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler{
    

    
     NSDictionary *parameters = @{@"user":@{@"name" :user_name,@"email" :email,@"image_url" :image_url,@"custom_name" :custom_name,@"bio" :biography,@"id" :user_id,@"password" :@"121788gloriA",@"password_confirmation" :@"121788gloriA",@"created_at" :[NSDate date],@"updated_at" :[NSDate date]}};
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    
    [manager POST:[NSString stringWithFormat:@"%@edit/user",BASE_URL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        
        
        handler([responseObject objectForKey:@"User"]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        errorHandler(error);
        
        
    }];
    
}






+(void)getUserInfoWithID:(NSNumber *)user_id andHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler{
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@user?id=%@",BASE_URL,user_id]];
    
    
    [[[JSONServiceParser alloc] init] getJSONFromUrl:url withHandler:^(id streamsData) {
        
      
        
        User *user  = [[User alloc] initWithDictionary:streamsData];
        
        
        handler(user);
        
    } orErrorHandler:^(NSError *err) {
        
        errorHandler(err);
        
        
    }];
    
    
    
    
}



+(void)addFriendVictim:(NSNumber *)victim_id fromAttacker:(NSNumber *)attacker_id WithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler{
    
  
    
    NSDictionary *parameters = @{@"users":@{@"attacking":attacker_id,@"victim":victim_id}};
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    
    [manager POST:[NSString stringWithFormat:@"%@friendships/create",BASE_URL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        
        User *userAddedFriend = [[User alloc] initWithDictionary:[responseObject objectForKey:@"Result"]];
        
        NSData *dataFriends = [NSKeyedArchiver archivedDataWithRootObject:userAddedFriend.friends];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:dataFriends forKey:@"user_friends"];
        
         [defaults  synchronize];
         
         
        handler([responseObject objectForKey:@"Result"]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        errorHandler(error);
        
        
    }];
    
    
    
}


+(void)removeFriendVictim:(NSNumber *)victim_id fromAttacker:(NSNumber *)attacker_id WithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler{
    
    
    
    NSDictionary *parameters = @{@"users":@{@"attacking":attacker_id,@"victim":victim_id}};
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    
    [manager POST:[NSString stringWithFormat:@"%@friendships/destroy",BASE_URL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        
        
        User *userRemovedFriend = [[User alloc] initWithDictionary:responseObject];
        
        NSData *dataFriends = [NSKeyedArchiver archivedDataWithRootObject:userRemovedFriend.friends];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:dataFriends forKey:@"user_friends"];
        
        [defaults  synchronize];
        
        
        handler([responseObject objectForKey:@"Result"]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        errorHandler(error);
        
        
    }];
    
    
    
}




+(void)getFollowingForUserInfoWithID:(NSNumber *)user_id andHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler{
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@following?id=%@",BASE_URL,user_id]];
    
    
    [[[JSONServiceParser alloc] init] getJSONFromUrl:url withHandler:^(id streamsData) {
        
        
        
        NSMutableArray *array = [NSMutableArray new];
        
        for (NSDictionary *dic in streamsData){
            [array addObject:[[User alloc] initWithDictionary:dic]];
            
            
        }
        
        
        handler(array);
        
    } orErrorHandler:^(NSError *err) {
        
        errorHandler(err);
        
        
    }];
    
    
    
    
}

+(void)getActivityForUserInfoWithID:(NSNumber *)user_id andHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler{
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@activity/list?id=%@",BASE_URL,user_id]];
    
    
    [[[JSONServiceParser alloc] init] getJSONFromUrl:url withHandler:^(id streamsData) {
        
        
        
        NSMutableArray *array = [NSMutableArray new];
        
        for (NSDictionary *dic in streamsData){
            
            if ([[dic objectForKey:@"trackable"] isKindOfClass:[NSNull class]]){
            
            
            }else{
            [array addObject:[[Notification alloc] initWithDictionary:dic]];
            }
            
            
            
        }
        
        
        handler(array);
        
    } orErrorHandler:^(NSError *err) {
        
        errorHandler(err);
        
        
    }];
    
    
    
    
}
+(void)DestroyPostForUser:(NSNumber *)user_id andPost:(NSNumber *)post_id WithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler{
    
    
    
    NSDictionary *parameters = @{@"user":@{@"id":user_id},@"post":@{@"id":post_id}};
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    
    [manager POST:[NSString stringWithFormat:@"%@post/destroy",BASE_URL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        
        
        handler(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        errorHandler(error);
        
        
    }];
    
    
    
}


+(void)DestroyCommentForUser:(NSNumber *)user_id andComment:(NSNumber *)comment_id WithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler{
    
    
    
    NSDictionary *parameters = @{@"user":@{@"id":user_id},@"comment":@{@"id":comment_id}};
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    
    [manager POST:[NSString stringWithFormat:@"%@comment/destroy",BASE_URL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        
        
        handler(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        errorHandler(error);
        
        
    }];
    
    
    
}



+(void)LikePost:(NSNumber *)post_id byUser:(NSNumber *)user_id WithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler{
    
    
    
    
    NSDictionary *parameters = @{@"user":@{@"id" :user_id},@"post":@{@"id" :post_id}};
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    
    [manager POST:[NSString stringWithFormat:@"%@like",BASE_URL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        
        
        handler(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        errorHandler(error);
        
        
    }];
    
    
    
}




+(void)DislikePost:(NSNumber *)post_id byUser:(NSNumber *)user_id WithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler{
    
    
    
    
    NSDictionary *parameters = @{@"user":@{@"id" :user_id},@"post":@{@"id" :post_id}};
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    
    [manager POST:[NSString stringWithFormat:@"%@dislike",BASE_URL] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        
        
        handler(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        
        errorHandler(error);
        
        
    }];
    
    
    
}



+(void)getSearchForKeyWord:(NSString *)keyword andHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler{
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@search?keywords=%@",BASE_URL,keyword]];
    
    
    [[[JSONServiceParser alloc] init] getJSONFromUrl:url withHandler:^(id streamsData) {
        
        
        
        NSMutableArray *array = [NSMutableArray new];
        
        for (NSDictionary *dic in [streamsData objectForKey:@"Result"]){
            [array addObject:[[User alloc] initWithDictionary:dic]];
            
            
        }
        
        
        handler(array);
        
    } orErrorHandler:^(NSError *err) {
        
        errorHandler(err);
        
        
    }];
    
    
    
    
}



+(void)getRecipeDetailWithID:(NSNumber *)recipe_id WithHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler{
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@recipe?id=%@",BASE_URL,recipe_id]];
    
    
    [[[JSONServiceParser alloc] init] getJSONFromUrl:url withHandler:^(id streamsData) {
        
    
        
        handler([[Post alloc] initWithDictionary:streamsData]);
        
    } orErrorHandler:^(NSError *err) {
        
        errorHandler(err);
        
        
    }];
    
    
    
    
}


+(void)getFavsForUserWithID:(NSNumber *)user_id andHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler{
    
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@likes?id=%@",BASE_URL,user_id]];
    
    
    [[[JSONServiceParser alloc] init] getJSONFromUrl:url withHandler:^(id streamsData) {
        
        
        NSMutableArray *array = [NSMutableArray new];
        
        for (NSDictionary *dic in streamsData){
            [array addObject:[[Post alloc] initWithDictionary:dic]];
            
            
        }
        
        
        handler(array);
        
    } orErrorHandler:^(NSError *err) {
        
        errorHandler(err);
        
        
    }];
    
}





+(void)checkLikeForUserWithID:(NSNumber *)user_id andPost:(NSNumber *)post_id andHandler:(void (^)(id)) handler orErrorHandler:(void (^)(NSError *)) errorHandler{


    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@check_like?user_id=%@&post_id=%@",BASE_URL,user_id,post_id]];
    
    
    [[[JSONServiceParser alloc] init] getJSONFromUrl:url withHandler:^(id streamsData) {
        
        
    
        
        
        handler([streamsData objectForKey:@"Result"]);
        
    } orErrorHandler:^(NSError *err) {
        
        errorHandler(err);
        
        
    }];

}
@end
