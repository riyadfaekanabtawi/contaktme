//
//  SBTVCustomAlertView.m
//  LipSync
//
//  Created by Desarrollo Android on 16-06-15.
//  Copyright (c) 2015 SmartBoxTV. All rights reserved.
//

#import "SBTVCustomAlertView.h"
#import "Functions.h"
@implementation SBTVCustomAlertView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


+(SBTVCustomAlertView *)createwithTitle:(NSString *)title andBody:(NSString *)body andActionButton:(NSString *)actionString andCancelTitle:(NSString *)cancelString andDelegate:(id)delegate hasTocloseFather:(BOOL)closefather{

    SBTVCustomAlertView * view = nil;
    
   

    view =[[[NSBundle mainBundle] loadNibNamed:@"SBTVCustomAlertView" owner:self options:nil] objectAtIndex: 0];
    
    view.closefather=closefather;
//    view.AlertTitle.font=[UIFont fontWithName:FONT_MEDIUM size:view.AlertTitle.font.pointSize];
//    view.AlertBody.font=[UIFont fontWithName:FONT_LIGHT size:view.AlertBody.font.pointSize];
//    view.closeAlertButton.titleLabel.font=[UIFont fontWithName:FONT_LIGHT size:view.closeAlertButton.titleLabel.font.pointSize];
//    view.actionButton.titleLabel.font=[UIFont fontWithName:FONT_LIGHT size:view.actionButton.titleLabel.font.pointSize];

    [view.closeAlertButton setTitle:cancelString forState:(UIControlStateNormal)];
    view.delegate=delegate;
    view.AlertBody.text=body;
    view.AlertTitle.text=title;
    

    [view.actionButton setTitle:actionString forState:(UIControlStateNormal)];
    
    UIWindow *frontWindow = [[UIApplication sharedApplication] keyWindow];
    [Functions fillContainerView:frontWindow.subviews[0] WithView:view];
   view.innerView.transform = CGAffineTransformMakeScale(0.0, 0.0);
    
    view.alpha=0.0f;
    [UIView animateWithDuration:0.2 delay:0.0 options:0
                     animations:^{
                         
                         view.alpha=0.95;
                     } completion:^(BOOL finished) {
                 
                     }];

    [UIView animateWithDuration:0.2 delay:0.1 options:0
                     animations:^{
                         
                         view.innerView.transform=CGAffineTransformIdentity;
                     } completion:^(BOOL finished) {
                         
                     }];
    
    return view;
    


}


-(IBAction)closeAlertViewTouchUpInisde:(id)sender{
    

        [UIView animateWithDuration:0.2 delay:0.1 options:0
                         animations:^{
                             
                             self.alpha=0.0;
                         } completion:^(BOOL finished) {
                             
                         }];
        
        [UIView animateWithDuration:0.2 delay:0.0 options:0
                         animations:^{
                             
                             self.innerView.transform=CGAffineTransformMakeScale(0.01, 0.01);
                         } completion:^(BOOL finished) {
                             self.innerView.transform=CGAffineTransformMakeScale(0.00, 0.00);
                             [self.delegate closeAlertView];
                         }];
    

   
  
}


-(IBAction)chooseAction:(id)sender{
    
    if(self.closefather){
        [self.delegate chooseAction];
        
    }else{
        [UIView animateWithDuration:0.2 delay:0.1 options:0
                         animations:^{
                             
                             self.alpha=0.0;
                         } completion:^(BOOL finished) {
                             
                         }];
        
        [UIView animateWithDuration:0.2 delay:0.0 options:0
                         animations:^{
                             
                             self.innerView.transform=CGAffineTransformMakeScale(0.01, 0.01);
                         } completion:^(BOOL finished) {
                             self.innerView.transform=CGAffineTransformMakeScale(0.00, 0.00);
                             [self.delegate closeAlertView];
                         }];
        
    }
    
    
}
@end
