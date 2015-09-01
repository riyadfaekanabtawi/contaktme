//
//  LoaderView.m
//  EstadioCDF
//
//  Created by SmartboxTV on 13-01-14.
//  Copyright (c) 2014 CDF. All rights reserved.
//

#import "SBTVLoaderView.h"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@implementation SBTVLoaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)endAnimationAndRemoveView{}

+(SBTVLoaderView *)create
{
    
    

    
    SBTVLoaderView *loader =nil;

        loader =[[[NSBundle mainBundle] loadNibNamed:@"SBTVLoaderView_iPhone" owner:self options:nil] objectAtIndex: 0];
        

    loader.popcornUIImage.image=  [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1" ofType:@"png"]];
   
    loader.cerrarButton.hidden=YES;
    
    loader.images = [[NSArray alloc] initWithObjects:
                    
                     [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1" ofType:@"png"]],
                     [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"2" ofType:@"png"]],
                     [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"]],
                     [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"4" ofType:@"png"]],
                     [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"5" ofType:@"png"]],
                     [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"6" ofType:@"png"]],

                     
                     
                     nil];
    
    
    
    
    loader.isAnimating = YES;
    loader.status = 0;
    
    [loader setHidden:NO];
    [loader.popcornUIImage setImage:  [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1" ofType:@"png"]]];
    
    [NSTimer scheduledTimerWithTimeInterval:.1 target:loader selector:@selector(updateAnimation) userInfo:nil repeats:NO];
    
    
    
    return loader;
    
    
}

- (BOOL)isAnimating {
    return self.isAnimating;
}
- (void)updateAnimation
{
    
    
    
    
    self.status = self.status+1;
    [self.popcornUIImage setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d",self.status]ofType:@"png"]]];
    [NSTimer scheduledTimerWithTimeInterval:1.0/20.0 target:self selector:@selector(updateAnimation) userInfo:nil repeats:NO];
    
    
    if(self.status==6){
        self.status=0;
        
    }
    }
-(void)startAnimation {
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished) {
        [self.activityIndicator startAnimating];
    }];
    
}
-(IBAction)cerrarLoader:(id)sender{
    
    [self.delegate closeLoaderView];
    
}
-(void)endAnimation {
    [self.activityIndicator stopAnimating];
    [self removeFromSuperview];
}

@end
