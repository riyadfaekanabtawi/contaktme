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
    self.signOutView.alpha = 0.0;
    
    self.user_name.font = [UIFont fontWithName:FONT_REGULAR size:self.user_name.font.pointSize];
    
    self.homeLabel.font = [UIFont fontWithName:FONT_REGULAR size:self.homeLabel.font.pointSize];
    self.signoutLabel.font = [UIFont fontWithName:FONT_REGULAR size:self.signoutLabel.font.pointSize];
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

    self.myProjectsLabel.transform = CGAffineTransformMakeScale(0.0, 0.0);
    [UIView animateWithDuration:1.0
                          delay:0.0
         usingSpringWithDamping:0.2
          initialSpringVelocity:6.00
                        options:UIViewAnimationOptionAllowUserInteraction animations:^{
                            self.myProjectsLabel.transform = CGAffineTransformIdentity;
        
        self.searchView.alpha = 0.0;
        self.lookforView.alpha = 0.0;
        self.myProjectsView.alpha = 1.0;
        self.topJobsView.alpha = 0.0;
        self.homeView.alpha = 0.0;
        self.signOutView.alpha = 0.0;
                        }
                     completion:^(BOOL finished) {
                         [self.delegate didSelectOption:@"myProjects"];
                     }];

}



-(IBAction)lookForProsTouchUpInside:(id)sender{
    
    self.lookforLabel.transform = CGAffineTransformMakeScale(0.0, 0.0);
    [UIView animateWithDuration:1.0
                          delay:0.0
         usingSpringWithDamping:0.2
          initialSpringVelocity:6.00
                        options:UIViewAnimationOptionAllowUserInteraction animations:^{
                            self.lookforLabel.transform = CGAffineTransformIdentity;
        
        self.searchView.alpha = 0.0;
        self.lookforView.alpha = 1.0;
        self.myProjectsView.alpha = 0.0;
        self.topJobsView.alpha = 0.0;
        self.homeView.alpha = 0.0;
        self.signOutView.alpha = 0.0;
                        }
                     completion:^(BOOL finished) {
                         [self.delegate didSelectOption:@"lookPros"];
                     }];
}



-(IBAction)TopJobsTouchUpInside:(id)sender{
    
    self.topJobsLabel.transform = CGAffineTransformMakeScale(0.0, 0.0);
    [UIView animateWithDuration:1.0
                          delay:0.0
         usingSpringWithDamping:0.2
          initialSpringVelocity:6.00
                        options:UIViewAnimationOptionAllowUserInteraction animations:^{
                            self.topJobsLabel.transform = CGAffineTransformIdentity;
                            
        
        self.searchView.alpha = 0.0;
        self.lookforView.alpha = 0.0;
        self.myProjectsView.alpha = 0.0;
        self.topJobsView.alpha = 1.0;
        self.homeView.alpha = 0.0;
        self.signOutView.alpha = 0.0;
                        }
                     completion:^(BOOL finished) {
                         [self.delegate didSelectOption:@"topJobs"];
                     }];
}


-(IBAction)HomeTouchUpInside:(id)sender{
    
    self.homeLabel.transform = CGAffineTransformMakeScale(0.0, 0.0);
    [UIView animateWithDuration:1.0
                          delay:0.0
         usingSpringWithDamping:0.2
          initialSpringVelocity:6.00
                        options:UIViewAnimationOptionAllowUserInteraction animations:^{
                            self.homeLabel.transform = CGAffineTransformIdentity;
        
        self.searchView.alpha = 0.0;
        self.lookforView.alpha = 0.0;
        self.myProjectsView.alpha = 0.0;
        self.topJobsView.alpha = 0.0;
        self.homeView.alpha = 1.0;
        self.signOutView.alpha = 0.0;
                        }
                     completion:^(BOOL finished) {
                         [self.delegate didSelectOption:@"home"];
                     }];
}



-(IBAction)SearchJobTouchUpInside:(id)sender{
      self.searchLabel.transform = CGAffineTransformMakeScale(0.0, 0.0);
    [UIView animateWithDuration:1.0
                          delay:0.0
         usingSpringWithDamping:0.2
          initialSpringVelocity:6.00
                        options:UIViewAnimationOptionAllowUserInteraction animations:^{
              self.searchLabel.transform = CGAffineTransformIdentity;
        self.searchView.alpha = 1.0;
        self.lookforView.alpha = 0.0;
        self.myProjectsView.alpha = 0.0;
        self.topJobsView.alpha = 0.0;
        self.homeView.alpha = 0.0;
        self.signOutView.alpha = 0.0;
                        }
                     completion:^(BOOL finished) {
                         [self.delegate didSelectOption:@"searchJobs"];
                     }];
    
}



-(IBAction)SignOutTouchUpInside:(id)sender{
    
    

    
    self.signoutLabel.transform = CGAffineTransformMakeScale(0.0, 0.0);
    
    [UIView animateWithDuration:1.0
                          delay:0.0
         usingSpringWithDamping:0.2
          initialSpringVelocity:6.00
                        options:UIViewAnimationOptionAllowUserInteraction animations:^{
                            self.signoutLabel.transform = CGAffineTransformIdentity;
                            self.searchView.alpha = 0.0;
                            self.lookforView.alpha = 0.0;
                            self.myProjectsView.alpha = 0.0;
                            self.topJobsView.alpha = 0.0;
                            self.homeView.alpha = 0.0;
                            self.signOutView.alpha = 1.0;
                        }
                     completion:^(BOOL finished) {
                         [self.delegate didSelectOption:@"signOut"];
                     }];
  
    

    
}



@end
