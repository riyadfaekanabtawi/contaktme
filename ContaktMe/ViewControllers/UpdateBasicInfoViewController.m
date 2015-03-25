//
//  Login.m
//  Copa Movistar Peru
//
//  Created by Juan Pablo Arias on 11-04-14.
//  Copyright (c) 2014 SmartboxTV. All rights reserved.
//

#import "UpdateBasicInfoViewController.h"
#import "AppDelegate.h"


#import "AFHTTPRequestOperationManager.h"
#import "SBTVServices.h"
#import "LoaderView.h"

#import "Functions.h"
@import CoreLocation;

@interface UpdateBasicInfoViewController () <CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) NSString *longitude;
@property (strong, nonatomic) NSString *latitude;
@end


@implementation UpdateBasicInfoViewController {
    NSTimer *timer;
    NSInteger slideIndex;
    NSArray *slides;
    LoaderView *_loader;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    //    _loader =[LoaderView create];
    //    [_loader startAnimation];
    //    UIWindow *frontWindow = [[UIApplication sharedApplication] keyWindow];
    //
    //    [Functions fillContainerView:frontWindow.subviews[0] WithView:_loader];

    [super viewDidLoad];
    
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    
    slideIndex = 0;
    
    //------------------------
    // Estilos
    //------------------------
    UIImage *image = [UIImage imageNamed:@"logo-movistar"];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:image];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    _textoIntroduccion.font =[UIFont fontWithName:FONT_LIGHT size:14];
    
    slides = [NSArray arrayWithObjects:@"login_1.png",@"login_2.png",@"login_6.png",@"login_3.png",@"login_4.png",@"login_5.png", nil];
    
    _tituloLogin.font = [UIFont fontWithName:FONT_LIGHT size:38];
    _bien.font = [UIFont fontWithName:FONT_LIGHT size:22];
    _mensaje.font = [UIFont fontWithName:FONT_LIGHT size:18];
    _bienvenido.font =[UIFont fontWithName:FONT_LIGHT size:22];
    _loginButton.titleLabel.font = [UIFont fontWithName:FONT_LIGHT size:18];
    _registerbutton.titleLabel.font = [UIFont fontWithName:FONT_LIGHT size:18];
    _registerMe.titleLabel.font = [UIFont fontWithName:FONT_LIGHT size:18];
    _GoButton.titleLabel.font=[UIFont fontWithName:FONT_LIGHT size:_GoButton.titleLabel.font.pointSize];
    
    
    [self.profession setValue:[UIFont fontWithName:FONT_LIGHT size: 14] forKeyPath:@"_placeholderLabel.font"];
    [self.fullname setValue:[UIFont fontWithName:FONT_LIGHT size: 14] forKeyPath:@"_placeholderLabel.font"];
    [self.cellphone setValue:[UIFont fontWithName:FONT_LIGHT size: 14] forKeyPath:@"_placeholderLabel.font"];
    
 
}


- (BOOL)prefersStatusBarHidden {
    return YES;
}
-(void)viewDidDisappear:(BOOL)animated {
    
  
    
}

-(void)viewDidAppear:(BOOL)animated {
    

    [self.view layoutIfNeeded];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *uniqueIdentifier = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    if([defaults objectForKey:@"id"]){
        
        if([[defaults objectForKey:@"id"]isEqualToString:[uniqueIdentifier stringByReplacingOccurrencesOfString:@"-" withString:@""]]){
            
            
            
            
        }else{
            
            
            
        }
        
        
    }
    
    //    if (![defaults boolForKey:TUTORIAL_LOGIN_SEEN] || TUTORIAL_ALWAYS_VISIBLE) {
    //        [TutorialView createWithScreenImageName:TUTORIAL_LOGIN Delegate:self];
    //    }
    
    [self slideshow];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)slideshow {
    [timer invalidate];
    timer =[NSTimer scheduledTimerWithTimeInterval:TIME_STEP target:self selector:@selector(timerStep) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
}

-(void)timerStep {
    slideIndex = (slideIndex + 1) % slides.count;
    
    [UIView transitionWithView:self.slideImage duration:1.5f options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionTransitionCrossDissolve animations:^{
        
        self.slideImage.image = [UIImage imageNamed:[slides objectAtIndex:slideIndex]];
        
    } completion:^(BOOL finished) {
        
    }];
}



-(BOOL)shouldAutorotate
{
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return UIInterfaceOrientationMaskLandscape;
    }else{
        return UIInterfaceOrientationMaskPortrait;
        
    }
}
- (void)showMessage:(NSString *)text withTitle:(NSString *)title
{
    [[[UIAlertView alloc] initWithTitle:title
                                message:text
                               delegate:self
                      cancelButtonTitle:@"OK!"
                      otherButtonTitles:nil] show];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}





- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == [alertView cancelButtonIndex]){
        
    }else{
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:
                                                    @""]];
        
        
    }
}








-(IBAction)ContinueUpadte:(id)sender{

 NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [SBTVServices requestTokenForUser:[defaults objectForKey:@"USER_ID"]
                          andPassword:[defaults objectForKey:@"USER_PASSWORD"]
                           AndHandler:^(id data) {
                               [SBTVServices updateBasicInfoWithFullName:self.fullname.text
                                                           andProfession:self.profession.text
                                                            andCellphone:self.cellphone.text
                                                               forUserID:[defaults objectForKey:@"USER_ID"]
                                                              AndHandler:^(id data) {
                                                                  [defaults setObject:self.fullname.text forKey:@"USER_NAME"];
                                                                  [defaults setObject:self.fullname.text forKey:@"USER_PROFESSIOM"];
                                                                  [defaults setObject:self.cellphone.text forKey:@"USER_CELL"];
                                                                  [defaults synchronize];
                                                              } orErrorHandler:^(NSError *err) {
                                                                  
                                                                  
                                                              }];

                               
                           } orErrorHandler:^(NSError *err) {
                               NSLog(@"%@",err);
                           }];
    
    
}



-(BOOL)textFieldShouldReturn:(UITextField*)textField
{
    
    
    if ([textField.text isEqualToString:@""])
    {
        [[[UIAlertView alloc] initWithTitle:@"Opps!"
                                    message:@"Field Cannot Be Empty"
                                   delegate:self
                          cancelButtonTitle:@"OK!"
                          otherButtonTitles:nil] show];    }
    else
    {
        NSInteger nextTag = textField.tag + 1;
        // Try to find next responder
        UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
        if (nextResponder) {
            // Found next responder, so set it.
            [nextResponder becomeFirstResponder];
        } else {
            // Not found, so remove keyboard.
            [textField resignFirstResponder];
        }
    }
    
    return NO; // We do not want UITextField to insert line-breaks.
}





@end
