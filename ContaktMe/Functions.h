//
//  Functions.h
//  EstadioCDF
//
//  Created by SmartboxTV on 30-12-13.
//  Copyright (c) 2013 CDF. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SWRevealViewController.h"

#define DEFAULTS_CREATED_REMINDER_KEY @"reminders"
#define DEFAULTS_REMINDERS_CALENDAR_KEY @"reminders_calendar"

#define CALENDAR_IDENTIFIER_KEY @"calendarIdentifier"
#define CALENDAR_TITLE @"LipSync"

@interface Functions : NSObject

+(void)shakeImage:(UIView *)image;
+(NSDate *)stringToDate:(NSString *)string;
+(NSDate *)stringToDate:(NSString *)string WithFormat:(NSString *)format;
+(NSString *)dateToString:(NSDate *)date WithFormat:(NSString *)format;
+(UIColor*)colorWithHexString:(NSString*)hex;
+ (BOOL) validateEmail: (NSString *) email;

+(BOOL)isDate:(NSDate *)date inRangeFirstDate:(NSDate *)firstDate lastDate:(NSDate *)lastDate;

+(void)buttonBounceAnimation:(UIView *)view;

+ (UIImage *) applyMonoChromeWithRandColor: (UIImage *)uIImage andColor:(CGColorRef )color;
+(void)deleteUserInfo;
+ (UIImage *)imageWithColor:(UIColor *)color;
+(void)fillContainerView:(UIView *)container WithView:(UIView *)view;
+(void)createReminderNotificationForMedia:(NSString *)mediaId WithTitle:(NSString *)title onDate:(NSDate *)date UntilDate:(NSDate *)endDate;
+(void)createReminderNotificationWithBody:(NSString *)mediaId WithTitle:(NSString *)title onDate:(NSDate *)date UntilDate:(NSDate *)endDate;
+(BOOL)reminderExistsForMedia:(NSString *)mediaId;

+(NSString *)getUUID;
+ (BOOL) validateUrl: (NSString *) candidate;
+(void) doLogout;
+(UIEdgeInsets )makeinsetForTableView:(UITableView *)tableView;
+(NSLayoutConstraint *)addView:(UIView *)view ToContainer:(UIView *)container WithTopMargin:(NSNumber *)topMargin LeftMargin:(NSNumber *)leftMargin BottomMargin:(NSNumber *)bottomMargin RightMargin:(NSNumber *)rightMargin Width:(NSNumber *)width Height:(NSNumber *)height;
@end
