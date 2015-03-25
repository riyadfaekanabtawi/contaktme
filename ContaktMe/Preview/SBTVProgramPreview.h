//
//  SBTVProgramPreview.h
//  SBTVProgramPreview
//
//  Created by SmartboxTV on 30-09-14.
//  Copyright (c) 2014 SmartboxTV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBTVPreviewViewCell.h"
#import "User.h"



@class SBTVProgramPreview;

@protocol SBTVProgramPreviewDelegate <NSObject>
@optional

-(void)removeView;
-(void)nearbyOffers;
-(void)nearbyProfessionals;
@end

@interface SBTVProgramPreview : UIView <SBTVPreviewViewCellDelegate>

@property (nonatomic,retain) id<SBTVProgramPreviewDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UIImageView *blurImageView;

@property (nonatomic,retain) SBTVPreviewViewCell *previousPreviewCell;
@property (nonatomic,retain) SBTVPreviewViewCell *mainPreviewCell;
@property (nonatomic,retain) SBTVPreviewViewCell *nextPreviewCell;
@property (nonatomic,retain) UIViewController *controller;
@property (nonatomic,retain) NSString *titleFont ;
@property (nonatomic,retain) NSString *channelFont;
@property (nonatomic,retain) NSString *descriptionFont;
@property (nonatomic,retain) NSString *monthFont;
@property (nonatomic,retain) NSString *hourFont;
@property (nonatomic,retain) NSString *remindFont;
@property (nonatomic,retain) NSArray *Allcontakts;
-(SBTVProgramPreview *)init;
-(SBTVProgramPreview *)initWithFrame:(CGRect)frame;

- (void)setProgramsConfig:(NSArray *)programs WithSelectedProgram:(User *)programselected;
- (void)setPrograms:(NSArray *)programs;

- (void)setPrograms:(NSArray *)programs WithSelectedProgram:(User *)programselected;

- (IBAction)backgroundTap:(id)sender;
- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer;

@end