//
//  AppDelegate.m
//  BeepGoosh
//
//  Created by Riyad Anabtawi on 1/11/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import "AppDelegate.h"
#import "contaktme-Swift.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    for (NSString *font in [UIFont familyNames]) {
        NSLog(@"%@", [UIFont fontNamesForFamilyName:font]);
    }
    //-- Set Notification
    if ([application respondsToSelector:@selector(isRegisteredForRemoteNotifications)])
    {
        // iOS 8 Notifications
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        
        [application registerForRemoteNotifications];
    }
    else
    {
        // iOS < 8 Notifications
        [application registerForRemoteNotificationTypes:
         (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)];
    }
    
    application.applicationIconBadgeNumber = 0;
    
    
    id localNotif = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    
    if (localNotif != nil) {
        self.pendingNotification = localNotif;
    }
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)devToken {
    
    
    NSString *token = [[devToken description] stringByTrimmingCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    
    //token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"content---%@", [token stringByReplacingOccurrencesOfString:@" " withString:@""]);
    //Guardamos el token push
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[token stringByReplacingOccurrencesOfString:@" " withString:@""] forKey:@"tokenPush"];
    [defaults synchronize];
    
    
    //const unsigned char *devTokenBytes = [devToken bytes];
    //self.registered = YES;
    //[self sendProviderDeviceToken:devTokenBytes]; // custom method
    NSLog(@"%@", [[NSString alloc] initWithData:devToken
                                       encoding:NSUTF8StringEncoding]);
    
//    NSUInteger capacity = [devToken length] * 2;
//    NSMutableString *stringBuffer = [NSMutableString stringWithCapacity:capacity];
//    for (int i=0; i<[devToken length]; ++i) {
//        //        [stringBuffer appendString:[self integerToBinary:(NSUInteger)devTokenBytes[i]]];
//        [stringBuffer appendFormat:@"%02lx",(unsigned long)devTokenBytes[i]];
//    }
//    
//    NSLog(@"%@", stringBuffer);
//    
//    [SBTVServices loginToSBTVWithDeviceToken:stringBuffer Handler:^(id data) {
//        
//        
//        NSLog(@"Login bitch!!!!!!! %@", data);
//    } orErrorHandler:^(NSError *err) {
//        NSLog(@"Not today bitch!!!! %@", err);
//    }];
    
}
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    /*
     {
     aps =     {
     alert = "Revisa el video CDF del gol de Barnechea
     ";
     badge = 1;
     sound = "default.caf";
     };
     id = 762092;
     t = 5;
     to = chile;
     v = 5431d9cd69cd02625a3243f8;
     }
     */
    
    application.applicationIconBadgeNumber = 0;
    
    if (application.applicationState == UIApplicationStateActive) {
        //[AGPushNoteView showWithNotificationMessage:[[userInfo objectForKey:@"aps"] objectForKey:@"alert"]];
        
        [SBTVPushDisplay displayMessage:[[userInfo objectForKey:@"aps"] objectForKey:@"alert"] messageData:userInfo action:^(id userInfo) {
            
            
            [self.delegate sbtvAppDidRecieveNotification:userInfo];
            
        } ];
    }
    else {
        self.pendingNotification = userInfo;
        [self.delegate sbtvAppDidRecieveNotification:userInfo];
    }
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
   // NSString *stringBuffer = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
//    
//    [SBTVServices loginToSBTVWithDeviceToken:stringBuffer Handler:^(id data) {
//        NSLog(@"Login bitch!!!!!!! %@", data);
//    } orErrorHandler:^(NSError *err) {
//        NSLog(@"Not today bitch!!!! %@", err);
//    }];
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
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

@end
