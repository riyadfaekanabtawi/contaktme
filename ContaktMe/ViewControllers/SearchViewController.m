//
//  SearchUserViewController.m
//  ContaktMe
//
//  Created by Riyad Anabtawi on 2/12/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import "SearchViewController.h"
#import "SWRevealViewController.h"
#import "Functions.h"
#import "SBTVServices.h"
#import "contaktme-Swift.h"
#import "AHCarouselViewController.h"
#import "NearbyJobsViewController.h"
@interface SearchViewController ()

@end

@implementation SearchViewController{
    nearbyJobs *_nearby;



}



-(void)selectedUser:(User *)user{}
-(void)Happy:(User *)user{}
-(void)Sad:(User *)user{}

- (void)viewDidLoad {
    

    
   self.sendApplication.alpha=1.0f;
    self.sorryLabel.font=[UIFont fontWithName:FONT_LIGHT size:self.sorryLabel.font.pointSize];
    self.retryButton.titleLabel.font=[UIFont fontWithName:FONT_BOLD size:self.retryButton.titleLabel.font.pointSize];
    [super viewDidLoad];
    self.noProfessionals.alpha=0.0f;
    self.radarAnimation.alpha=1.0f;
    _radar =[RadarView alloc] ;
    _radar.animating=YES;
    [_radar initialSetup];
 _timer=   [NSTimer scheduledTimerWithTimeInterval:5
                                     target:self
                                   selector:@selector(hideRadar)
                                   userInfo:nil
                                    repeats:NO];
    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    
    logo.clipsToBounds = YES;
    logo.contentMode = UIViewContentModeScaleAspectFit;
    
    logo.frame=CGRectMake(logo.frame.origin.x, logo.frame.origin.y, 140, 20);
    UIView *logoContainer = [[UIView alloc] initWithFrame:logo.frame];
    [logoContainer addSubview:logo];
    
    self.navigationItem.titleView = logoContainer;
    self.navigationItem.leftBarButtonItem.title = @"";
    self.navigationController.navigationBar.topItem.title = @"";
      [self slideMenuSetup];

    
    
    if(_isSearchingOffers){
    self.sorryLabel.text=@"Sorry we could not find any job offers near you, please try again.";
        [SBTVServices getUserCountry:^(id data) {
            
            
            
            
            //        _timer=   [NSTimer scheduledTimerWithTimeInterval:5
            //                                                   target:self
            //                                                 selector:@selector(hideRadar)
            //                                                 userInfo:nil
            //                                                  repeats:NO];
            
            [self hideRadar];
        } orErrorHandler:^(NSError *err) {
            
        }];

    }else if(_isSearchingProfessionals){
    self.sorryLabel.text=@"Sorry we could not find any professionals near you, please try again.";
        [SBTVServices getUserCountry:^(id data) {
            
            
            
            
            //        _timer=   [NSTimer scheduledTimerWithTimeInterval:5
            //                                                   target:self
            //                                                 selector:@selector(hideRadar)
            //                                                 userInfo:nil
            //                                                  repeats:NO];
            
            [self hideRadar];
        } orErrorHandler:^(NSError *err) {
            
        }];

    
    }
  
    
    


}


-(void)hideRadar{
    
    
    if(_isSearchingOffers){
        [_timer invalidate];
        _timer=nil;
        self.radarAnimation.alpha=0.0f;
        self.noProfessionals.alpha=0.0f;
        [UIView animateWithDuration:2 animations:^{
            self.radarAnimation.alpha=0.0f;
            self.noProfessionals.alpha=1.0f;
            
            
        } completion:^(BOOL finished) {
            
        }];
        _nearby = [self.storyboard instantiateViewControllerWithIdentifier:@"nearbyJobs"];
    
        [Functions fillContainerView:self.view WithView:_nearby.view];
        
        [self.view layoutIfNeeded];
    
    
    }else{
        
        [_timer invalidate];
        _timer=nil;
        self.radarAnimation.alpha=1.0f;
        self.noProfessionals.alpha=0.0f;
        [UIView animateWithDuration:2 animations:^{
            self.radarAnimation.alpha=0.0f;
            self.noProfessionals.alpha=1.0f;
            
            
        } completion:^(BOOL finished) {
            
        }];
        
    }
  



}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


-(IBAction)retryTouchUpInside:(id)sender{

    self.radarAnimation.alpha=1.0f;
    self.noProfessionals.alpha=0.0f;
    _timer=   [NSTimer scheduledTimerWithTimeInterval:5
                                               target:self
                                             selector:@selector(hideRadar)
                                             userInfo:nil
                                              repeats:NO];
}
- (void)slideMenuSetup
{
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.navigationController.navigationBar removeGestureRecognizer:self.revealViewController.panGestureRecognizer];
        
        [self.navigationController.navigationBar setTintColor:[Functions colorWithHexString:@"F35e46"]];
    }
}



-(void)userAppliedforJob:(Job *)job{

    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        UIWindow *frontWindow = [[UIApplication sharedApplication] keyWindow];
        
        [Functions fillContainerView:frontWindow.subviews[0] WithView:self.sendApplication];
        self.sendApplication.alpha=1.0f;
    } completion:nil];
    

}

-(IBAction)hideApplicationView:(id)sender{


    [UIView animateWithDuration:2.0 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
       
        [self.sendApplication removeFromSuperview];
       
        self.sendApplication.alpha=0.0f;
    } completion:nil];

}
@end
