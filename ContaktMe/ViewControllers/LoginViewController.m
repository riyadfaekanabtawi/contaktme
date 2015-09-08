//
//  LoginViewController.m
//  LipSync
//
//  Created by SmartBoxTV on 01-06-15.
//  Copyright (c) 2015 SmartBoxTV. All rights reserved.
//

#import "LoginViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "Functions.h"
#import "Services.h"


#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@implementation LoginViewController{

    BOOL  goToSettings;
  
}

-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBar.topItem.title = @"";
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(0.0, 0.0);
    shadow.shadowColor = [UIColor clearColor];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];

     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
 
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                             forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.facebookLabel.font=[UIFont fontWithName:FONT_REGULAR size:self.facebookLabel.font.pointSize];
    

    
    if(![defaults objectForKey:@"user_id"]){
        
        
    }else{
        if(![defaults objectForKey:@"user_custom_name"]){
            
            
            goToSettings = YES;
            [self performSegueWithIdentifier:@"home" sender:self];
        }else{
            goToSettings = NO;
            [self performSegueWithIdentifier:@"home" sender:self];
            
        }
        
    }
}


-(void)viewDidLoad{
  [[self navigationController] setNavigationBarHidden:YES animated:YES];
     self.navigationController.navigationBar.topItem.title = @"";

    
    self.navigationController.navigationBar.topItem.title = @"";

    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
   
    
 

}

-(BOOL)prefersStatusBarHidden{
    return YES;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if([segue.identifier isEqualToString:@"iniciarSesion"]){
    
       // RegisterViewController *controller = segue.destinationViewController;
        
    
    }
    
    
    if([segue.identifier isEqualToString:@"home"]){
        if(goToSettings){
           // Home *controller = segue.destinationViewController;
            
           // controller.GoToSettingsAutomatically = YES;
        
        }else{
        
            //Home *controller = segue.destinationViewController;
            
           // controller.GoToSettingsAutomatically = NO;
        
        }
    
       
    
    }
    

}

-(IBAction)ingresarFacebook:(id)sender{


 
 [self callServiceFacebook];
    


}



-(void)callServiceFacebook{
    

    [self showLoader];
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions:@[@"email",@"user_friends"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            // Process error
        } else if (result.isCancelled) {
            // Handle cancellations
        } else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            
            
            if ([FBSDKAccessToken currentAccessToken])
            {
                NSLog(@"Token is available : %@",[[FBSDKAccessToken currentAccessToken]tokenString]);
                
                [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"id, name, link, first_name,cover, last_name, picture.type(large), email, birthday, bio ,location ,friends ,hometown , friendlists"}]
                 startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                     if (!error)
                     {
                         
                         [Services RegisterWithNAme:[result objectForKey:@"name"]
                                           andEmail:[result objectForKey:@"email"]
                                        andImageURL:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?width=175&height=175",[result objectForKey:@"id"]]
                                     andBackDropUrl:[[result objectForKey:@"cover"] objectForKey:@"source"]
                                        andPassword:@"121788gloriA"
                            andpasswordConfirmation:@"121788gloriA"
                                          andUserID:[result objectForKey:@"id"]
                                        WithHandler:^(id response) {
                                       
                    
                   
                             
                             User *userLoggedIn = [[User alloc] initWithDictionary:response];
                             
                             NSData *dataFriends = [NSKeyedArchiver archivedDataWithRootObject:userLoggedIn.friends];
                             
                             NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                             [defaults setObject:dataFriends forKey:@"user_friends"];
                             [defaults setObject:[response objectForKey:@"id"] forKey:@"user_id"];
                             [defaults setObject:[response objectForKey:@"image_url"] forKey:@"user_image"];
                             [defaults setObject:[response objectForKey:@"name"] forKey:@"user_name"];
                             
                             if([[response objectForKey:@"custom_name"] isKindOfClass:[NSNull class]]){
                                 [defaults setObject:@"" forKey:@"user_custom_name"];
                                 
                             }else{
                                 [defaults setObject:[response objectForKey:@"custom_name"] forKey:@"user_custom_name"];
                             }
                             
                             
                             if([[response objectForKey:@"bio"] isKindOfClass:[NSNull class]]){
                                 [defaults setObject:@"" forKey:@"user_bio"];
                                 
                             }else{
                                 [defaults setObject:[response objectForKey:@"bio"] forKey:@"user_bio"];
                             }
                             [defaults setObject:[response objectForKey:@"email"] forKey:@"user_email"];
                             
                             [defaults synchronize];
                            [self hideLoader];
                             
                             
                             if ([[defaults objectForKey:@"user_custom_name"] isEqualToString:@""] || [[defaults objectForKey:@"user_bio"] isEqualToString:@""] ){
                                 goToSettings = YES;
                                 [self performSegueWithIdentifier:@"home" sender:self];
                             }else{
                                 
                                 goToSettings = NO;
                                 [self performSegueWithIdentifier:@"home" sender:self];
                                 
                             }
                             
                             
                             
                             
                             
                         } orErrorHandler:^(NSError *error) {
                            
                         }];
                     }
                     else
                     {
                         NSLog(@"Error %@",error);
                     }
                 }];
                
            }
            
            
            
            
          
        }
    }];
    
  
    
    
    
    
    
    
    
}



-(BOOL)shouldAutorotate
{
    return NO;
}

-(NSUInteger)supportedInterfaceOrientations
{
    
    return UIInterfaceOrientationMaskPortrait;
    
}


-(void)viewWillDisappear:(BOOL)animated{

    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
[[self navigationController] setNavigationBarHidden:YES animated:YES];
}


-(void)viewDidDisappear:(BOOL)animated{
[[self navigationController] setNavigationBarHidden:YES animated:YES];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;

}




-(void)showLoader{
    self.loader = [LoadingAnimationView new];
    [self.loader showWithImage:[UIImage imageNamed:@"spinner.png"] andColor:@"#ffffff" andMessage:@"" inView:self.view];
    [self.loader startAnimation];
    [self.view bringSubviewToFront:self.loader];

}


-(void)hideLoader{
     [self.loader hide];
    [self.loader removeFromSuperview];
   


}
@end
