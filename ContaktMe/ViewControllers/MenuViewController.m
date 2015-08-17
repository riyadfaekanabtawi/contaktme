//
//  MenuViewController.m
//  
//
//  Created by Riyad Anabtawi on 8/15/15.
//
//

#import "MenuViewController.h"
#import "UIImageView+WebCache.h"
@implementation MenuViewController






-(void)viewDidLoad{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.user_image.layer.cornerRadius = self.user_image.frame.size.width/2;
    self.user_image.layer.masksToBounds = YES;
    
    
    
    
    self.searchView.alpha = 0.0;
    self.lookforView.alpha = 0.0;
    self.myProjectsView.alpha = 0.0;
    self.topJobsView.alpha = 0.0;
    self.homeView.alpha = 1.0;
    
    self.user_name.font = [UIFont fontWithName:FONT_REGULAR size:self.user_name.font.pointSize];
    
    self.homeLabel.font = [UIFont fontWithName:FONT_REGULAR size:self.homeLabel.font.pointSize];
    
     self.topJobsLabel.font = [UIFont fontWithName:FONT_REGULAR size:self.topJobsLabel.font.pointSize];
    
    self.searchLabel.font = [UIFont fontWithName:FONT_REGULAR size:self.searchLabel.font.pointSize];
    
    self.lookforLabel.font = [UIFont fontWithName:FONT_REGULAR size:self.lookforLabel.font.pointSize];
    
    self.menuTitle.font = [UIFont fontWithName:FONT_REGULAR size:self.menuTitle.font.pointSize];
      self.myProjectsLabel.font = [UIFont fontWithName:FONT_REGULAR size:self.myProjectsLabel.font.pointSize];
    
    [self.user_image sd_setImageWithURL:[NSURL URLWithString:[defaults objectForKey:@"user_image"]]];
    
    self.user_name.text = [defaults objectForKey:@"user_name"];

}


-(void)viewDidAppear:(BOOL)animated{



}

-(IBAction)myprojectsTouchUpInside:(id)sender{

    [UIView animateWithDuration:0.3 animations:^{
        
        self.searchView.alpha = 0.0;
        self.lookforView.alpha = 0.0;
        self.myProjectsView.alpha = 1.0;
        self.topJobsView.alpha = 0.0;
        self.homeView.alpha = 0.0;
    }];
    
    
    [self.delegate didSelectOption:@"myProjects"];

}



-(IBAction)lookForProsTouchUpInside:(id)sender{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.searchView.alpha = 0.0;
        self.lookforView.alpha = 1.0;
        self.myProjectsView.alpha = 0.0;
        self.topJobsView.alpha = 0.0;
        self.homeView.alpha = 0.0;
    }];
    [self.delegate didSelectOption:@"lookPros"];
}



-(IBAction)TopJobsTouchUpInside:(id)sender{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.searchView.alpha = 0.0;
        self.lookforView.alpha = 0.0;
        self.myProjectsView.alpha = 0.0;
        self.topJobsView.alpha = 1.0;
        self.homeView.alpha = 0.0;
    }];
    [self.delegate didSelectOption:@"topJobs"];
}


-(IBAction)HomeTouchUpInside:(id)sender{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.searchView.alpha = 0.0;
        self.lookforView.alpha = 0.0;
        self.myProjectsView.alpha = 0.0;
        self.topJobsView.alpha = 0.0;
        self.homeView.alpha = 1.0;
    }];
    [self.delegate didSelectOption:@"home"];
}



-(IBAction)SearchJobTouchUpInside:(id)sender{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.searchView.alpha = 1.0;
        self.lookforView.alpha = 0.0;
        self.myProjectsView.alpha = 0.0;
        self.topJobsView.alpha = 0.0;
        self.homeView.alpha = 0.0;
    }];
    
    
    [self.delegate didSelectOption:@"searchJobs"];
    
}



@end
