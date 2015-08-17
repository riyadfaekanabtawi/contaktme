//
//  SBTVCustomAlertView.h
//  LipSync
//
//  Created by Desarrollo Android on 16-06-15.
//  Copyright (c) 2015 SmartBoxTV. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SBTVCustomAlertViewDelegate <NSObject>
-(void)closeAlertView;
-(void)chooseAction;
@end
@interface SBTVCustomAlertView : UIView
@property (nonatomic,retain) id<SBTVCustomAlertViewDelegate> delegate;
@property (nonatomic,retain) IBOutlet UILabel *AlertTitle;
@property BOOL closefather;
@property (nonatomic,retain) IBOutlet UILabel *AlertBody;
@property (nonatomic,retain) IBOutlet UIView *innerView;
@property (nonatomic,retain) IBOutlet UIButton *closeAlertButton;
@property (nonatomic,retain) IBOutlet UIButton *actionButton;
+(SBTVCustomAlertView *)createwithTitle:(NSString *)title andBody:(NSString *)body andActionButton:(NSString *)actionString andCancelTitle:(NSString *)cancelString andDelegate:(id)delegate hasTocloseFather:(BOOL)closefather;
@end
