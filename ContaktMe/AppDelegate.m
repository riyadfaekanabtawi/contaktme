//
//  AppDelegate.m
//  LipSync
//
//  Created by SmartBoxTV on 01-06-15.
//  Copyright (c) 2015 SmartBoxTV. All rights reserved.
//

#import "AppDelegate.h"



#import "LoginViewController.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>


static NSString *const kTrackingId = @"UA-65636271-1";


@interface AppDelegate ()
@property(nonatomic, assign) BOOL okToWait;
@property(nonatomic, copy) void (^dispatchHandler)(GAIDispatchResult result);



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    
//        NSArray *fontFamilies = [UIFont familyNames];
//    
//        for (int i = 0; i < [fontFamilies count]; i++)
//        {
//            NSString *fontFamily = [fontFamilies objectAtIndex:i];
//            NSArray *fontNames = [UIFont fontNamesForFamilyName:[fontFamilies objectAtIndex:i]];
//            NSLog (@"%@: %@", fontFamily, fontNames);
//        }
    
    
//    if([[UIApplication sharedApplication] respondsToSelector:@selector(registerForRemoteNotificationTypes:)]) {
//        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
//         (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
//        
//    }
//    
//    if([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
//        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert) categories:nil]];
//        
//    }
    
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    
    
    //Analytics
    NSLog(@"[GOOGLE]///////INIT Google Analytics///////");
//    // Optional: automatically send uncaught exceptions to Google Analytics.
//    [GAI sharedInstance].trackUncaughtExceptions = YES;
//    
//    // Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
//    [GAI sharedInstance].dispatchInterval = 20;
//    
//    // Optional: set Logger to VERBOSE for debug information.
//    [[[GAI sharedInstance] logger] setLogLevel:kGAILogLevelVerbose];
//    
//    // Initialize tracker. Replace with your tracking ID.
//    [[GAI sharedInstance] trackerWithTrackingId:kTrackingId];
//    
   
    
    //Analytics
    NSLog(@"[GOOGLE]///////INIT Google Analytics///////");
    // Optional: automatically send uncaught exceptions to Google Analytics.
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    
    // Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
    [GAI sharedInstance].dispatchInterval = 20;
    
    // Optional: set Logger to VERBOSE for debug information.
    [[[GAI sharedInstance] logger] setLogLevel:kGAILogLevelVerbose];
    
    // Initialize tracker. Replace with your tracking ID.
    [[GAI sharedInstance] trackerWithTrackingId:kTrackingId];

    [Fabric with:@[CrashlyticsKit]];

 
    
    return YES;
}


// This method sends hits in the background until either we're told to stop background processing,
// we run into an error, or we run out of hits.  We use this to send any pending Google Analytics
// data since the app won't get a chance once it's in the background.
- (void)sendHitsInBackground {
    self.okToWait = YES;
    __weak AppDelegate *weakSelf = self;
    __block UIBackgroundTaskIdentifier backgroundTaskId =
    [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        weakSelf.okToWait = NO;
    }];
    
    if (backgroundTaskId == UIBackgroundTaskInvalid) {
        return;
    }
    
    self.dispatchHandler = ^(GAIDispatchResult result) {
        // If the last dispatch succeeded, and we're still OK to stay in the background then kick off
        // again.
        if (result == kGAIDispatchGood && weakSelf.okToWait ) {
            [[GAI sharedInstance] dispatchWithCompletionHandler:weakSelf.dispatchHandler];
        } else {
            [[UIApplication sharedApplication] endBackgroundTask:backgroundTaskId];
        }
    };
    [[GAI sharedInstance] dispatchWithCompletionHandler:self.dispatchHandler];
}

-(void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    [application registerForRemoteNotifications];
}
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    /*
     {
     aps =     {
     alert = Golazo;
     badge = 1;
     sound = "gol.wav";
     };
     mach = 220901;
     type = 1;
     }
     [userInfo objectForKey:@"type"]
     [[userInfo objectForKey:@"aps"] objectForKey:@"sound"]
     */
    
//    application.applicationIconBadgeNumber = 0;
//    
//    if (application.applicationState == UIApplicationStateActive) {
//        //[AGPushNoteView showWithNotificationMessage:[[userInfo objectForKey:@"aps"] objectForKey:@"alert"]];
//        
//        [SBTVPushDisplay displayMessage:[[userInfo objectForKey:@"aps"] objectForKey:@"alert"] messageData:userInfo action:^(id userInfo) {
//            
//            
//            
//            
//            [self.delegate sbtvAppDidRecieveNotification:userInfo];
//            
//        } ];
//        
//        
//    }
//    else {
//        self.pendingNotification = userInfo;
//        [self.delegate sbtvAppDidRecieveNotification:userInfo];
//    }
}
-(void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    
    //token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"content---%@", [token stringByReplacingOccurrencesOfString:@" " withString:@""]);
    //Guardamos el token push
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[token stringByReplacingOccurrencesOfString:@" " withString:@""] forKey:@"tokenPush"];
    [defaults synchronize];
}

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"0" forKey:@"tokenPush"];
    [defaults synchronize];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   // [self.delegate goBackifAppisinBackground];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    if([defaults objectForKey:@"votedMatch"] && [defaults objectForKey:@"User_ID"]){
//        [SBTVServices CheckRatingsForMatch:[defaults objectForKey:@"votedMatch"]
//         
//                                   andUser:[defaults objectForKey:@"User_ID"]
//                               WithHandler:^(id data) {
//                                   
//                                   if([data objectForKey:@"data"]==0){
//                                       
//                                       [self StartTimerwithMatchID:_match_id andUserID:_user_id andPlayerID:_player_id];
//                                   }else{
//                                       
//                                       [self endTimer];
//                                   }
//                                   
//                               } orErrorHandler:^(NSError *err) {
//                                   
//                               }];
//        
//    }
    
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    return [AppDelegate supportedInterfaceOrientations];
}

static BOOL _isVideoPlaying = NO;

+(void)setVideoPlaying:(BOOL)isPlaying {
    _isVideoPlaying = isPlaying;
    
}




-(void)endTimer{
    [_serviceTimer invalidate];
    _serviceTimer = nil;
    
    
}

-(void)StartTimerwithMatchID:(NSNumber *)match_id andUserID:(NSNumber *)user_id andPlayerID:(NSNumber *)player_id{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:match_id forKey:@"votedMatch"];
    [defaults setObject:user_id forKey:@"User_ID"];
    
    [defaults setObject:player_id forKey:@"Player_ID"];
    [defaults synchronize];
    [_serviceTimer invalidate];
    _serviceTimer = nil;
    
    
    int i = arc4random() % 120;
    _match_id=match_id;
    _user_id=user_id;
    _player_id=player_id;
    
    
    _serviceTimer =  [NSTimer scheduledTimerWithTimeInterval:i
                                                      target:self
                                                    selector:@selector(InsertVote)
                                                    userInfo:nil
                                                     repeats:YES];
    
}

-(void)InsertVote{
    
    
    
   // NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
//    [SBTVServices InsertVoteforUser:[defaults objectForKey:@"User_ID"]
//                          forPlayer:[defaults objectForKey:@"Player_ID"]
//                        duringMatch:[defaults objectForKey:@"votedMatch"]
//                        WithHandler:^(id message) {
//                            
//                            [_serviceTimer invalidate];
//                            _serviceTimer = nil;
//                            
//                            [defaults setObject:@"NO" forKey:@"haspendingVotes"];
//                            
//                            
//                            [defaults synchronize];
//                        } orErrorHandler:^(NSError *err) {
//                            
//                            [defaults setObject:@"YES" forKey:@"haspendingVotes"];
//                            [defaults synchronize];
//                            
//                            
//                        }];
    
    
    
}


+(BOOL)isVideoPlaying {
    return _isVideoPlaying;
}


+(BOOL)shouldAutorotate {
    return YES;
}

+(NSUInteger)supportedInterfaceOrientations {
    if (_isVideoPlaying) {
        return UIInterfaceOrientationMaskAll;
    }
    else {
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
        {
            return UIInterfaceOrientationMaskLandscape;
            
        }else{
            return UIInterfaceOrientationMaskPortrait;
            
        }
    }
}

+(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    if (_isVideoPlaying) {
        return YES;
    }
    else {
        
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
        {
            return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
            
        }else{
            return UIInterfaceOrientationIsPortrait(toInterfaceOrientation);
            
        }
        
    }
}
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
 

    NSLog(@"Facebook URL");
 return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                                   openURL:url
                                                         sourceApplication:sourceApplication
                                                                annotation:annotation];;
    
    
    
return YES;
    
}





@end
