//
//  AppDelegate.h
//  LipSync
//
//  Created by SmartBoxTV on 01-06-15.
//  Copyright (c) 2015 SmartBoxTV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>

@protocol AppiShit
-(void)sbtvAppDidRecieveNotification:(NSDictionary *)notification;


@end
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property NSNumber *user_id;
@property NSNumber *player_id;
@property NSNumber *match_id;
@property NSNumber *media_id;
@property (strong, nonatomic) NSTimer *serviceTimer;
+(void)setVideoPlaying:(BOOL)isPlaying;
@property NSDictionary *pendingNotification;
+(BOOL)isVideoPlaying;

+(BOOL)shouldAutorotate;
+(NSUInteger)supportedInterfaceOrientations;

+(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation;
-(void)StartTimerwithMatchID:(NSNumber *)match_id andUserID:(NSNumber *)user_id andPlayerID:(NSNumber *)player_id;
@property (nonatomic,retain) id<AppiShit> delegate;



@end
