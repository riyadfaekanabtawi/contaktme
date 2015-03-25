//
//  PreviewView.m
//  OTTCanales
//
//  Created by Franklin Cruz on 25-04-14.
//  Copyright (c) 2014 SmartboxTV. All rights reserved.
//

#import "SBTVProgramPreview.h"
#import "User.h"


#import "UIImage+ImageEffects.h"

#define PREVIEW_CELL_WIDTH_IPAD                     446.0f
#define PREVIEW_CELL_WIDTH_IPHONE                   320.0f

#define PREVIEW_CELL_HEIGHT_IPAD                    540.0f
#define PREVIEW_CELL_HEIGHT_IPHONE                500.0f

#define PREVIEW_SIDE_CELL_VISIBLE_PERCENT_IPAD      0.2f
#define PREVIEW_SIDE_CELL_VISIBLE_PERCENT_IPHONE    0.0f

#define PREVIEW_SIDE_CELL_INVISIBLE_PERCENT_IPAD    0.8f
#define PREVIEW_SIDE_CELL_INVISIBLE_PERCENT_IPHONE  1.f

#define PREVIEW_MINIMUM_CELL_SCALE_IPAD             0.85f
#define PREVIEW_MINIMUM_CELL_SCALE_IPHONE           1.0f

#define PREVIEW_MINIMUM_CELL_ALPHA_IPAD             0.1f
#define PREVIEW_MINIMUM_CELL_ALPHA_IPHONE           1.1f


@interface SBTVProgramPreview()

@property (nonatomic,retain) NSMutableArray *cells;

@property (nonatomic) CGFloat previewCellWidth;
@property (nonatomic) CGFloat previewCellHeight;
@property (nonatomic) CGFloat *centerMAgic;
@property (nonatomic) CGFloat visibleCellPercent;
@property (nonatomic) CGFloat invisibleCellPercent;

@property (nonatomic) CGFloat minimumCellAlpha;
@property (nonatomic) CGFloat minimumCellScale;

@end

@implementation SBTVProgramPreview {
    CGFloat previewStartX;
    NSArray *currentPrograms;
    User *program;
    NSInteger currentIndex;
    NSInteger indexOffset;
    CGFloat currentScroll;
    CGFloat scrollOffset;
    
    
    BOOL debunced;
    NSTimer *debunceTimer;
}




-(void)loadSizeValues {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        self.previewCellWidth = PREVIEW_CELL_WIDTH_IPAD;
        self.previewCellHeight = PREVIEW_CELL_HEIGHT_IPAD;

        self.visibleCellPercent = PREVIEW_SIDE_CELL_VISIBLE_PERCENT_IPAD;
        self.invisibleCellPercent = PREVIEW_SIDE_CELL_INVISIBLE_PERCENT_IPAD;

        self.minimumCellAlpha = PREVIEW_MINIMUM_CELL_ALPHA_IPAD;
        self.minimumCellScale = PREVIEW_MINIMUM_CELL_SCALE_IPAD;
    }
    else {
        
        if(IS_IPHONE_4){
        
        self.previewCellWidth =  320;
        self.previewCellHeight = 420;
            
        }if(IS_IPHONE_5){
            
            self.previewCellWidth =  320;
            self.previewCellHeight = 500;
        }
        else if(IS_IPHONE_6){

         self.previewCellHeight = self.frame.size.height-120;
         self.previewCellWidth =  370;
        
        }else if(IS_IPHONE_6Plus){
            
            self.previewCellHeight = self.frame.size.height-60;
            self.previewCellWidth =  410;
        }
        
       

        self.visibleCellPercent = PREVIEW_SIDE_CELL_VISIBLE_PERCENT_IPHONE;
        self.invisibleCellPercent = PREVIEW_SIDE_CELL_INVISIBLE_PERCENT_IPHONE;

        self.minimumCellAlpha = PREVIEW_MINIMUM_CELL_ALPHA_IPHONE;
        self.minimumCellScale = PREVIEW_MINIMUM_CELL_SCALE_IPHONE;
    }
}




-(SBTVProgramPreview *)init {




    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"PreviewView" owner:self options:nil] objectAtIndex: 0];

    }
    else {
        self = [[[NSBundle mainBundle] loadNibNamed:@"PreviewView" owner:self options:nil] objectAtIndex: 0];
    }

    [self loadSizeValues];


   UIImage *bluredImage = [self getBlurredImage:self];



    self.alpha = 0.0f;
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveEaseOut animations:^{

        self.alpha = 1.0f;

    } completion:^(BOOL finished) {

    }];

    [UIView transitionWithView:self.blurImageView
                      duration:0.5f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        self.blurImageView.image = bluredImage;


                    } completion:^(BOOL finished) {
                        
                    }];
    
    return self;



}

-(SBTVProgramPreview *)initWithFrame:(CGRect)frame{

    self = [self init];

    if (self) {
        self.frame = frame;
    }

    return self;
}

-(SBTVProgramPreview *)setTitleFont:(NSString *)titleFont andChanelFont:(NSString *)channelFont andDescriptionFont:(NSString *)descriptionFont andMonthFont:(NSString *)monthFont andHourFont:(NSString *)hourFont andRemindFont:(NSString *)remindFont{




    _titleFont=titleFont;
    _channelFont=channelFont;
    _descriptionFont=descriptionFont;
    _monthFont=monthFont;
    _hourFont=hourFont;
    _remindFont=remindFont;

    return self;
}



-(void)previewViewCellTap:(SBTVPreviewViewCell *)cell {
    //[self.delegate previewView:self UserDidSelectProgram:cell.program];
}


-(void)setPrograms:(NSArray *)programs {
    currentPrograms = programs;
    currentIndex = 0;
    indexOffset = 0;
    currentScroll = [self cellCenterX];
    program = [programs objectAtIndex:0];

    debunced = NO;

    CGFloat margin = [self cellsMargin];

    self.cells = [NSMutableArray new];
    SBTVPreviewViewCell *cell;
    CGFloat xPosition = [self cellCenterX];
    CGFloat yPosition = (self.frame.size.height / 2.0f) - (self.previewCellHeight / 2.0f);

    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        yPosition -= 40;
    }

    NSInteger maxCells = MIN(programs.count, 5);
    for(int i = 0; i < maxCells; ++i) {
        cell = [[SBTVPreviewViewCell alloc]initWithFrame:
                CGRectMake(xPosition,
                           yPosition,
                           self.previewCellWidth, self.previewCellHeight)];
        [self addSubview:cell];
        cell.delegate = self;
        cell.controller=self.controller;
        xPosition += self.previewCellWidth + margin;
        cell.mainView.alpha = 0.0f;
        //cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0f green:arc4random_uniform(255) / 255.0f blue:arc4random_uniform(255) / 255.0f alpha:1.0f];
        [self.cells addObject:cell];

    }

    [UIView animateWithDuration:0.3f delay:0.5f options:UIViewAnimationOptionAllowUserInteraction animations:^{

        SBTVPreviewViewCell *cell = [self.cells objectAtIndex:0];
        cell.mainView.alpha = 1.0f;
        for (int i = 1; i < self.cells.count; ++i) {
            cell = [self.cells objectAtIndex:i];
            cell.mainView.alpha = 0.5f;
            cell.mainView.transform = CGAffineTransformMakeScale(self.minimumCellScale, self.minimumCellScale);
        }

    } completion:^(BOOL finished) {

    }];


    for (int i = 0; i < [self.cells count] && i + indexOffset < [programs count]; ++i) {
        SBTVPreviewViewCell *cell = [self.cells objectAtIndex:i];
        cell.program = [programs objectAtIndex:i + indexOffset];
    }

}


- (void)setPrograms:(NSArray *)programs WithSelectedProgram:(User *)programselected {
    self.Allcontakts=nil;
    self.Allcontakts=[NSArray new];
    self.Allcontakts=programs;
    if([programs count]==1){
    
        //NSInteger index = [programs indexOfObject:programselected];
       // programs = [programs subarrayWithRange:NSMakeRange(index, programs.count - index)];
        currentPrograms = programs;
        currentIndex = 0;
        indexOffset = 0;
        currentScroll = [self cellCenterXOneContact];
        
        debunced = NO;
        
        CGFloat margin = [self cellsMargin];
        
        self.cells = [NSMutableArray new];
        SBTVPreviewViewCell *cell;
              cell.ChatButton.hidden=YES;
         cell.footerSettings.hidden=YES;
        cell.controller=self.controller;
        CGFloat xPosition = [self cellCenterXOneContact];
        CGFloat yPosition = (self.frame.size.height / 2.0f) - (self.previewCellHeight / 2.0f);
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            if(IS_IPHONE_5){
                yPosition -= 70;
                
            }else if(IS_IPHONE_6){
                
                yPosition -= 40;
                
            }else if(IS_IPHONE_4){
                
                yPosition -= 120;
                
            }
            
        }
        
        NSInteger maxCells = MIN(programs.count, 5);
        for(int i = 0; i < maxCells; ++i) {
            cell = [[SBTVPreviewViewCell alloc]initWithFrame:
                    CGRectMake(xPosition,
                               yPosition,
                               self.previewCellWidth, self.previewCellHeight)];
                  cell.ChatButton.hidden=YES;
            cell.footerSettings.hidden=YES;
            [self addSubview:cell];
            
            cell.delegate = self;
            
                    cell.controller=self.controller;
            xPosition += self.previewCellWidth + margin;
            cell.mainView.alpha = 0.0f;
            //cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0f green:arc4random_uniform(255) / 255.0f blue:arc4random_uniform(255) / 255.0f alpha:1.0f];
            [self.cells addObject:cell];
            
        }
        
        [UIView animateWithDuration:0.3f delay:0.5f options:UIViewAnimationOptionAllowUserInteraction animations:^{
            
            SBTVPreviewViewCell *cell = [self.cells objectAtIndex:0];
                  cell.ChatButton.hidden=YES;
            cell.footerSettings.hidden=YES;
            cell.mainView.alpha = 1.0f;
            for (int i = 1; i < self.cells.count; ++i) {
                cell = [self.cells objectAtIndex:i];
                cell.mainView.alpha = 1.f;
                
                cell.mainView.transform = CGAffineTransformMakeScale(self.minimumCellScale, self.minimumCellScale);
            }
            
        } completion:^(BOOL finished) {
            
        }];
        
        
        for (int i = 0; i < [self.cells count] && i + indexOffset < [programs count]; ++i) {
            SBTVPreviewViewCell *cell = [self.cells objectAtIndex:i];
            cell.program = [programs objectAtIndex:i + indexOffset];
        }
        
      cell.ChatButton.hidden=YES;
        cell.footerSettings.hidden=YES;
    
    }else{
    
        NSInteger index = [programs indexOfObject:programselected];
        programs = [programs subarrayWithRange:NSMakeRange(index, programs.count - index)];
        currentPrograms = programs;
        currentIndex = 0;
        indexOffset = 0;
        currentScroll = [self cellCenterX];
        
        debunced = NO;
        
        CGFloat margin = [self cellsMargin];
        
        self.cells = [NSMutableArray new];
        SBTVPreviewViewCell *cell;
         cell.ChatButton.hidden=YES;
        cell.footerSettings.hidden=YES;
        cell.controller=self.controller;
        CGFloat xPosition = [self cellCenterX];
        CGFloat yPosition = (self.frame.size.height / 2.0f) - (self.previewCellHeight / 2.0f);
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            if(IS_IPHONE_5){
                yPosition -= 70;
                
            }else if(IS_IPHONE_6){
                
                yPosition -= 40;
                
            }else if(IS_IPHONE_4){
                
                yPosition -= 120;
                
            }
            
        }
        
        NSInteger maxCells = MIN(programs.count, 5);
        for(int i = 0; i < maxCells; ++i) {
            
            
            if(IS_IPHONE_6){
                cell = [[SBTVPreviewViewCell alloc]initWithFrame:
                        CGRectMake(xPosition-self.previewCellWidth+45,
                                   yPosition,
                                   self.previewCellWidth, self.previewCellHeight)];
            
            }else if(IS_IPHONE_6Plus){
                cell = [[SBTVPreviewViewCell alloc]initWithFrame:
                        CGRectMake(xPosition-self.previewCellWidth+110,
                                   yPosition,
                                   self.previewCellWidth, self.previewCellHeight)];
            
            
            }else{
                cell = [[SBTVPreviewViewCell alloc]initWithFrame:
                        CGRectMake(xPosition-355,
                                   yPosition,
                                   self.previewCellWidth, self.previewCellHeight)];
            
            }

            [self addSubview:cell];
            cell.close.hidden=YES;
            cell.footerSettings.hidden=YES;
            cell.closeImage.hidden=YES;
            cell.delegate = self;
                  cell.ChatButton.hidden=YES;
                    cell.controller=self.controller;
            xPosition += self.previewCellWidth + margin;
            cell.mainView.alpha = 0.0f;
            //cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0f green:arc4random_uniform(255) / 255.0f blue:arc4random_uniform(255) / 255.0f alpha:1.0f];
            [self.cells addObject:cell];
            
        }
        
        [UIView animateWithDuration:0.3f delay:0.5f options:UIViewAnimationOptionAllowUserInteraction animations:^{
            
            SBTVPreviewViewCell *cell = [self.cells objectAtIndex:0];
            cell.mainView.alpha = 1.0f;
            cell.close.hidden=YES;
            cell.footerSettings.hidden=YES;
                     cell.ChatButton.hidden=YES;
            cell.closeImage.hidden=YES;
            for (int i = 1; i < self.cells.count; ++i) {
                cell = [self.cells objectAtIndex:i];
                cell.mainView.alpha = 1.f;
        
                cell.mainView.transform = CGAffineTransformMakeScale(self.minimumCellScale, self.minimumCellScale);
            }
        
        } completion:^(BOOL finished) {
            
        }];
        
        
        for (int i = 0; i < [self.cells count] && i + indexOffset < [programs count]; ++i) {
            SBTVPreviewViewCell *cell = [self.cells objectAtIndex:i];
            cell.program = [programs objectAtIndex:i + indexOffset];
        }
        
     
    }
    }



- (void)setProgramsConfig:(NSArray *)programs WithSelectedProgram:(User *)programselected {
    self.Allcontakts=nil;
    self.Allcontakts=[NSArray new];
    self.Allcontakts=programs;
    if([programs count]==1){
        
        //NSInteger index = [programs indexOfObject:programselected];
        // programs = [programs subarrayWithRange:NSMakeRange(index, programs.count - index)];
        currentPrograms = programs;
        currentIndex = 0;
        indexOffset = 0;
        currentScroll = [self cellCenterXOneContact];
        
        debunced = NO;
        
        CGFloat margin = [self cellsMargin];
        
        self.cells = [NSMutableArray new];
        SBTVPreviewViewCell *cell;
        cell.close.hidden=YES;
        cell.footer.hidden=YES;
        cell.footerSettings.hidden=NO;
                 cell.ChatButton.hidden=YES;
        cell.closeImage.hidden=YES;
        cell.controller=self.controller;
        CGFloat xPosition = [self cellCenterXOneContact];
        CGFloat yPosition = (self.frame.size.height / 2.0f) - (self.previewCellHeight / 2.0f);
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            if(IS_IPHONE_5){
                yPosition -= 70;
                
            }else if(IS_IPHONE_6){
                
                yPosition -= 40;
                
            }else if(IS_IPHONE_4){
                
                yPosition -= 120;
                
            }
            
        }
        
        NSInteger maxCells = MIN(programs.count, 5);
        for(int i = 0; i < maxCells; ++i) {
            cell = [[SBTVPreviewViewCell alloc]initWithFrame:
                    CGRectMake(xPosition,
                               yPosition,
                               self.previewCellWidth, self.previewCellHeight)];
            cell.close.hidden=YES;
            cell.closeImage.hidden=YES;
             cell.footerSettings.hidden=NO;
                     cell.ChatButton.hidden=YES;
            cell.footer.hidden=YES;
            [self addSubview:cell];
            
            cell.delegate = self;
            
            cell.controller=self.controller;
            xPosition += self.previewCellWidth + margin;
            cell.mainView.alpha = 0.0f;
            //cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0f green:arc4random_uniform(255) / 255.0f blue:arc4random_uniform(255) / 255.0f alpha:1.0f];
            [self.cells addObject:cell];
            
        }
        
        [UIView animateWithDuration:0.3f delay:0.5f options:UIViewAnimationOptionAllowUserInteraction animations:^{
            
            SBTVPreviewViewCell *cell = [self.cells objectAtIndex:0];
            cell.close.hidden=YES;
            cell.closeImage.hidden=YES;
             cell.footerSettings.hidden=NO;
                     cell.ChatButton.hidden=YES;
            cell.footer.hidden=YES;
            cell.mainView.alpha = 1.0f;
            for (int i = 1; i < self.cells.count; ++i) {
                cell = [self.cells objectAtIndex:i];
                cell.mainView.alpha = 1.f;
                cell.mainView.transform = CGAffineTransformMakeScale(self.minimumCellScale, self.minimumCellScale);
            }
            
        } completion:^(BOOL finished) {
            
        }];
        
        
        for (int i = 0; i < [self.cells count] && i + indexOffset < [programs count]; ++i) {
            SBTVPreviewViewCell *cell = [self.cells objectAtIndex:i];
            cell.program = [programs objectAtIndex:i + indexOffset];
            
        }
                 cell.ChatButton.hidden=YES;
        cell.footer.hidden=YES;
        cell.close.hidden=YES;
         cell.footerSettings.hidden=NO;
        cell.closeImage.hidden=YES;
        
        
    }else{
        
        NSInteger index = [programs indexOfObject:programselected];
        programs = [programs subarrayWithRange:NSMakeRange(index, programs.count - index)];
        currentPrograms = programs;
        currentIndex = 0;
        indexOffset = 0;
        currentScroll = [self cellCenterX];
        
        debunced = NO;
        
        CGFloat margin = [self cellsMargin];
        
        self.cells = [NSMutableArray new];
        SBTVPreviewViewCell *cell;
                 cell.ChatButton.hidden=NO;
        cell.controller=self.controller;
        CGFloat xPosition = [self cellCenterX];
        CGFloat yPosition = (self.frame.size.height / 2.0f) - (self.previewCellHeight / 2.0f);
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            if(IS_IPHONE_5){
                yPosition -= 70;
                
            }else if(IS_IPHONE_6){
                
                yPosition -= 40;
                
            }else if(IS_IPHONE_4){
                
                yPosition -= 120;
                
            }
            
        }
        
        NSInteger maxCells = MIN(programs.count, 5);
        for(int i = 0; i < maxCells; ++i) {
            
            
            if(IS_IPHONE_6){
                cell = [[SBTVPreviewViewCell alloc]initWithFrame:
                        CGRectMake(xPosition-self.previewCellWidth+45,
                                   yPosition,
                                   self.previewCellWidth, self.previewCellHeight)];
                
            }else if(IS_IPHONE_6Plus){
                cell = [[SBTVPreviewViewCell alloc]initWithFrame:
                        CGRectMake(xPosition-self.previewCellWidth+110,
                                   yPosition,
                                   self.previewCellWidth, self.previewCellHeight)];
                
                
            }else{
                cell = [[SBTVPreviewViewCell alloc]initWithFrame:
                        CGRectMake(xPosition-355,
                                   yPosition,
                                   self.previewCellWidth, self.previewCellHeight)];
                
            }
            cell.close.hidden=YES;
                     cell.ChatButton.hidden=YES;
            cell.footer.hidden=YES;
             cell.footerSettings.hidden=NO;
            cell.closeImage.hidden=YES;
            [self addSubview:cell];
            cell.close.hidden=YES;
            cell.closeImage.hidden=YES;
            cell.delegate = self;
            
            cell.controller=self.controller;
            xPosition += self.previewCellWidth + margin;
            cell.mainView.alpha = 0.0f;
            //cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0f green:arc4random_uniform(255) / 255.0f blue:arc4random_uniform(255) / 255.0f alpha:1.0f];
            [self.cells addObject:cell];
            
        }
        
        [UIView animateWithDuration:0.3f delay:0.5f options:UIViewAnimationOptionAllowUserInteraction animations:^{
            
            SBTVPreviewViewCell *cell = [self.cells objectAtIndex:0];
            cell.mainView.alpha = 1.0f;
            cell.close.hidden=YES;
            cell.ChatButton.hidden=YES;
            cell.footer.hidden=YES;
             cell.footerSettings.hidden=NO;
            cell.closeImage.hidden=YES;
            for (int i = 1; i < self.cells.count; ++i) {
                cell = [self.cells objectAtIndex:i];
                cell.mainView.alpha = 1.f;
                
                cell.mainView.transform = CGAffineTransformMakeScale(self.minimumCellScale, self.minimumCellScale);
            }
            
        } completion:^(BOOL finished) {
            
        }];
        
        
        for (int i = 0; i < [self.cells count] && i + indexOffset < [programs count]; ++i) {
            SBTVPreviewViewCell *cell = [self.cells objectAtIndex:i];
            cell.program = [programs objectAtIndex:i + indexOffset];
        }
        
        
    }
}


-(CGFloat)maxScroll {
    return ((currentPrograms.count - 1) * -(self.previewCellWidth + [self cellsMargin])) + (self.previewCellWidth * self.visibleCellPercent) + [self cellsMargin];
}

-(CGFloat)cellsMargin {
    return (self.frame.size.width / 2.0f - self.previewCellWidth / 2.0f) - (self.previewCellWidth * self.visibleCellPercent);
}

-(CGFloat)cellCenterX {
    return ((self.frame.size.width / 2.0f - self.previewCellWidth / 2.0f));
}
-(CGFloat)cellCenterXOneContact {
    
    
    if(IS_IPHONE_6){
     return ((self.frame.size.width / 2.0f - self.previewCellWidth / 2.0f)-self.previewCellWidth+45);
    
    }else if(IS_IPHONE_5){
    
     return ((self.frame.size.width / 2.0f - self.previewCellWidth / 2.0f)-355);
    
    
    
    }else if(IS_IPHONE_4){
     return ((self.frame.size.width / 2.0f - self.previewCellWidth / 2.0f)-355);
    
    }else{
        
          return ((self.frame.size.width / 2.0f - self.previewCellWidth / 2.0f)-self.previewCellWidth+110);
    }
   
}
- (IBAction)backgroundTap:(id)sender {

    [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionAllowUserInteraction animations:^{

        self.alpha = 0.0f;

    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];

}

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer {

    
    
    if([self.Allcontakts count]==1){
    
    
    
    }else{
        CGFloat requiredSpeed = 500;
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            requiredSpeed = 400;
        }
        
        
        CGPoint translation = [recognizer translationInView:self];
        CGFloat margin = [self cellsMargin];
        
        CGPoint velocity = [recognizer velocityInView:self];
        CGFloat sing = velocity.x < 0 ? -1.0f : 1.0f;
        
        if (recognizer.state == UIGestureRecognizerStateBegan) {
            CGRect firstFrame = [[self.cells objectAtIndex:0] frame];
            previewStartX = firstFrame.origin.x;
        }
        else if (recognizer.state == UIGestureRecognizerStateEnded) {
            
            
            NSArray *sorted = [self.cells sortedArrayWithOptions:NSSortStable usingComparator:^NSComparisonResult(SBTVPreviewViewCell *obj1, SBTVPreviewViewCell *obj2) {
                CGFloat obj1Distance = fabs(obj1.frame.origin.x - [self cellCenterX]);
                CGFloat obj2Distance = fabs(obj2.frame.origin.x - [self cellCenterX]);
                
                if (obj1Distance > obj2Distance) {
                    return NSOrderedDescending;
                }
                else if(obj1Distance < obj2Distance) {
                    return NSOrderedAscending;
                }
                else {
                    return NSOrderedSame;
                }
            }];
            
            NSInteger targetCellIndex = [self.cells indexOfObject:[sorted objectAtIndex:0]];
            if (fabsf(velocity.x) > requiredSpeed) {
                if (sing > 0) {
                    --targetCellIndex;
                }
                else {
                    ++targetCellIndex;
                }
            }
            
            targetCellIndex = MIN(MAX(targetCellIndex, 0),self.cells.count - 1);
            
            CGFloat requiredOffset = [self cellCenterX] - [[self.cells objectAtIndex:targetCellIndex] frame].origin.x;
            
            currentScroll += translation.x + requiredOffset;
            currentScroll = MAX(MIN([self cellCenterX], currentScroll), [self maxScroll]);
            
            [UIView animateWithDuration:fabsf(requiredOffset) < 50 ? 0.5f : fabsf(requiredOffset) * 0.0005f
                                  delay:0.0f
                                options:0
                             animations:^{
                                 CGRect frame;
                                 CGFloat cellWidth = self.previewCellWidth;
                                 CGFloat cellMargin = [self cellsMargin];
                                 
                                 for (int i = 0; i < self.cells.count; ++i) {
                                     SBTVPreviewViewCell *cell = [self.cells objectAtIndex:i];
                                     frame = cell.frame;
                                     frame.origin.x = currentScroll + ((cellWidth + cellMargin) * i) + scrollOffset;
                                     cell.frame = frame;
                                 }
                                 
                                 CGFloat maxDistance = (self.previewCellWidth + [self cellsMargin]) * 3;
                                 CGFloat cellsCenterPosition = [self cellCenterX];
                                 for (int i = 0; i < self.cells.count; ++i) {
                                     CGFloat distance = fabsf([[self.cells objectAtIndex:i] frame].origin.x - cellsCenterPosition);
                                     CGFloat scale = MAX(self.minimumCellScale, 1.0f - (distance / maxDistance));
                                     CGFloat alpha = MAX(self.minimumCellAlpha, 1.0f - ((distance / maxDistance) * 2));
                                     
                                     [[self.cells objectAtIndex:i] mainView].transform = CGAffineTransformMakeScale(scale, scale);
                                     [[self.cells objectAtIndex:i] mainView].alpha = alpha;
                                 }
                                 
                             }
                             completion:^(BOOL finished) {
                                 
                                 CGFloat maxDistance = (self.previewCellWidth + [self cellsMargin]) * 3;
                                 CGFloat cellsCenterPosition = [self cellCenterX];
                                 for (int i = 0; i < self.cells.count; ++i) {
                                     CGFloat distance = fabsf([[self.cells objectAtIndex:i] frame].origin.x - cellsCenterPosition);
                                     CGFloat scale = MAX(self.minimumCellScale, 1.0f - (distance / maxDistance));
                                     //CGFloat alpha = MAX(self.minimumCellAlpha, 1.0f - ((distance / maxDistance) * 2));
                                     
                                     [[self.cells objectAtIndex:i] mainView].transform = CGAffineTransformMakeScale(scale, scale);
                                     //
                                     [[self.cells objectAtIndex:i] mainView].alpha = 1;
                                 }
                             }];
            
            
        }
        else {
            CGRect frame;
            CGFloat cellWidth = self.previewCellWidth;
            CGFloat cellMargin = [self cellsMargin];
            for (int i = 0; i < self.cells.count; ++i) {
                SBTVPreviewViewCell *cell = [self.cells objectAtIndex:i];
                frame = cell.frame;
                frame.origin.x = previewStartX + translation.x + ((cellWidth + cellMargin) * i);
                cell.frame = frame;
            }
            
            CGRect lastFrame = [[self.cells lastObject] frame];
            CGRect firstFrame = [[self.cells objectAtIndex:0] frame];
            
            if (sing < 0 && firstFrame.origin.x < -((cellWidth + cellMargin) * 2 - self.visibleCellPercent * cellWidth)) {
                
                CGFloat newStartX = [[self.cells objectAtIndex:1] frame].origin.x - translation.x;
                CGFloat lastRealPostion = lastFrame.origin.x - firstFrame.origin.x + scrollOffset;
                
                if (lastRealPostion < fabsf([self maxScroll])) {
                    ++indexOffset;
                    SBTVPreviewViewCell *first = [self.cells objectAtIndex:0];
                    [self.cells removeObjectAtIndex:0];
                    
                    CGRect newFrame = [first frame];
                    newFrame.origin.x = [[self.cells lastObject] frame].origin.x + self.previewCellWidth + margin;
                    [first setFrame:newFrame];
                    [self.cells addObject:first];
                    first.program = [currentPrograms objectAtIndex:indexOffset + (self.cells.count - 1)];
                    
                    scrollOffset += newStartX - previewStartX;
                    previewStartX = newStartX;
                }
                
                
            }
            
            if (sing > 0 && lastFrame.origin.x > self.frame.size.width + ((cellWidth + cellMargin) * 2 - self.visibleCellPercent * cellWidth)) {
                
                CGFloat newStartX = firstFrame.origin.x - cellWidth - cellMargin - translation.x;
                CGFloat newScrollOffset = newStartX - currentScroll;
                CGFloat firstRealPosition = firstFrame.origin.x - newScrollOffset;
                
                if (firstRealPosition < [self cellCenterX]) {
                    --indexOffset;
                    SBTVPreviewViewCell *last = [self.cells lastObject];
                    [self.cells removeLastObject];
                    
                    CGRect newFrame = [last frame];
                    newFrame.origin.x = [[self.cells objectAtIndex:0] frame].origin.x - self.previewCellWidth - margin;
                    [last setFrame:newFrame];
                    
                    [self.cells insertObject:last atIndex:0];
                    last.program = [currentPrograms objectAtIndex:indexOffset];
                    scrollOffset = newStartX - currentScroll;
                    previewStartX = newStartX;
                }
                
            }
            
            CGFloat maxDistance = (self.previewCellWidth + [self cellsMargin]) * 3;
            CGFloat cellsCenterPosition = [self cellCenterX];
            for (int i = 0; i < self.cells.count; ++i) {
                CGFloat distance = fabsf([[self.cells objectAtIndex:i] frame].origin.x - cellsCenterPosition);
                CGFloat scale = MAX(self.minimumCellScale, 1.0f - (distance / maxDistance));
              //  CGFloat alpha = MAX(self.minimumCellAlpha, 1.0f - ((distance / maxDistance) * 2));
                
                [[self.cells objectAtIndex:i] mainView].transform = CGAffineTransformMakeScale(scale, scale);
                [[self.cells objectAtIndex:i] mainView].alpha = 1;
            }
            
            
        }
        

    
    }
   
}



-(void)viewDidLayoutSubviews {

}

- (UIImage*)getBlurredImage:(UIView *)view {


    UIGraphicsBeginImageContext(CGSizeMake(view.frame.size.width, view.frame.size.height));
    [view drawViewHierarchyInRect:(CGRect){view.frame.origin, view.frame.size.width, view.frame.size.height} afterScreenUpdates:YES]; // view is the view you are grabbing the screen shot of. The view that is to be blurred.
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    // Gaussian Blur
    //image = [image applyBlurWithRadius:100.0f tintColor:[UIColor colorWithWhite:0.3f alpha:1.0f] saturationDeltaFactor:1.0f maskImage:nil];

    
    // Box Blur
    //image = [image boxblurImageWithBlur:0.2f];
    
    return image;
}


-(void)removeView{

    [self.delegate removeView];

}

-(void)nearbyProfessionals{

    [self.delegate nearbyProfessionals];

}

-(void)nearbyOffers{
    [self.delegate nearbyOffers];

}
@end
