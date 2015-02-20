//
//  LoaderView.m
//  BeepGoosh
//
//  Created by Riyad Anabtawi on 1/11/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import "LoaderView.h"

@implementation LoaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+(LoaderView *)create {
    
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        LoaderView *view = [[[NSBundle mainBundle] loadNibNamed:@"LoaderView" owner:self options:nil] objectAtIndex: 0];
        
        view.alpha = 0;
        
        UIWindow *frontWindow = [[UIApplication sharedApplication] keyWindow];
        
        [frontWindow.subviews[0] addSubview:view];
        
        CGRect frame = view.frame;
        frame.origin.x = 0;
        frame.size.width = 1024;
        
        view.frame = frame;
        
        CGRect logoframe = view.logoImageView.frame;
        logoframe.origin.x = frame.size.width / 2 - logoframe.size.width / 2;
        
        view.logoImageView.frame = logoframe;
        
        CGRect activityFrame = view.activityIndicator.frame;
        activityFrame.origin.x = frame.size.width / 2 - activityFrame.size.width / 2;
        
        view.activityIndicator.frame = activityFrame;
        
        return view;
    }else{
        
        LoaderView *view = [[[NSBundle mainBundle] loadNibNamed:@"LoaderView" owner:self options:nil] objectAtIndex: 0];
        
        view.alpha = 1;
        
        UIWindow *frontWindow = [[UIApplication sharedApplication] keyWindow];
        
        [frontWindow.subviews[0] addSubview:view];
        
        CGRect frame = view.frame;
        frame.origin.x = 0;
        frame.size.width = 320;
        
        view.frame = frame;
        
        CGRect logoframe = view.logoImageView.frame;
        logoframe.origin.x = frame.size.width / 2 - logoframe.size.width / 2;
        
        view.logoImageView.frame = logoframe;
        
        CGRect activityFrame = view.activityIndicator.frame;
        activityFrame.origin.x = frame.size.width / 2 - activityFrame.size.width / 2;
        
        view.activityIndicator.frame = activityFrame;
        
        return view;
        
        
    }
}

-(void)startAnimation {
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished) {
        [self.activityIndicator startAnimating];
    }];
    
}

-(void)endAnimation {
    [self.activityIndicator stopAnimating];
    [self removeFromSuperview];
}

@end
