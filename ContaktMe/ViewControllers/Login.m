//
//  Login.m
//  Copa Movistar Peru
//
//  Created by Juan Pablo Arias on 11-04-14.
//  Copyright (c) 2014 SmartboxTV. All rights reserved.
//

#import "Login.h"
#import "AppDelegate.h"


#import "AFHTTPRequestOperationManager.h"
#import "SBTVServices.h"
#import "LoaderView.h"

#import "Functions.h"
@interface Login ()

@end

@implementation Login {
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
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        // iOS 7
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    } else {
        // iOS 6
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    }

    
    [super viewDidLoad];
}


- (BOOL)prefersStatusBarHidden {
    return YES;
}
-(void)viewDidDisappear:(BOOL)animated {
    
    [_loader endAnimation];
    [_loader removeFromSuperview];
    
}

-(void)viewDidAppear:(BOOL)animated {
     self.topLogin.constant=self.view.frame.size.height;
     self.topRegister.constant=self.view.frame.size.height;
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

-(void)showLoggedInUI {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ( [defaults objectForKey:@"equipoFavorito"] != nil ) {
        [self performSegueWithIdentifier:@"home" sender:self];
    }
    else {
        [self performSegueWithIdentifier:@"seleccion_equipos" sender:self];
    }
    
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
                                                    @"itms-apps://itunes.apple.com/pe/app/copa-movistar/id908547643?l=en&mt=8"]];
        
        
    }
}



-(IBAction)login:(id)sender{

    [UIView animateWithDuration:0.5 animations:^{
        self.loginButton.alpha=0.0f;
        self.registerbutton.alpha=0.0f;
        self.topLogin.constant=0.0f;
                self.topLogo.constant=self.view.frame.size.height/3;
        [self.view layoutIfNeeded];
        
        
    } completion:^(BOOL finished) {
        
    }];

}


-(IBAction)registerUser:(id)sender{
    
    [UIView animateWithDuration:0.5 animations:^{
        self.loginButton.alpha=0.0f;
        self.registerbutton.alpha=0.0f;
        self.topRegister.constant=0.0f;
        self.topLogo.constant=self.view.frame.size.height/3;
        [self.view layoutIfNeeded];
        
        
    } completion:^(BOOL finished) {
        
    }];
    
}

-(IBAction)TapLogin:(id)sender{

    [self.email resignFirstResponder];
    [self.password resignFirstResponder];
    [UIView animateWithDuration:0.5 animations:^{
        self.topLogin.constant=self.view.frame.size.height;
        self.loginButton.alpha=1.0f;
        self.topLogo.constant=0;
        self.registerbutton.alpha=1.0f;
           [self.view layoutIfNeeded];
        
        
    } completion:^(BOOL finished) {
        
    }];

}



-(IBAction)TapRegister:(id)sender{
    
    [self.fullName resignFirstResponder];
    [self.confirmPassword resignFirstResponder];
    [self.passwordRegister resignFirstResponder];
    [self.emailRegsiter resignFirstResponder];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.topRegister.constant=self.view.frame.size.height;
        self.loginButton.alpha=1.0f;
        self.topLogo.constant=0;
        self.registerbutton.alpha=1.0f;
        [self.view layoutIfNeeded];
        
        
    } completion:^(BOOL finished) {
        
    }];
    
}



-(IBAction)Go:(id)sender{

    [self.email resignFirstResponder];
    [self.password resignFirstResponder];
    [UIView animateWithDuration:0.5 animations:^{
        self.topLogin.constant=self.view.frame.size.height;
        self.loginButton.alpha=0.0f;
        self.topLogo.constant=0;
        self.registerbutton.alpha=0.0f;
        [self.view layoutIfNeeded];
        
        
    } completion:^(BOOL finished) {
        [self performSegueWithIdentifier:@"home" sender:self];
        self.loginButton.alpha=1.0f;
       
        self.registerbutton.alpha=1.0f;
    }];

}


-(IBAction)RegisterMe:(id)sender{
    
    [self.fullName resignFirstResponder];
    [self.confirmPassword resignFirstResponder];
    [self.passwordRegister resignFirstResponder];
    [self.emailRegsiter resignFirstResponder];
    [UIView animateWithDuration:0.5 animations:^{
        self.topRegister.constant=self.view.frame.size.height;
        self.loginButton.alpha=0.0f;
        self.topLogo.constant=0;
        self.registerbutton.alpha=0.0f;
        [self.view layoutIfNeeded];
        
        
    } completion:^(BOOL finished) {
        [self performSegueWithIdentifier:@"home" sender:self];
        self.loginButton.alpha=1.0f;
        
        self.registerbutton.alpha=1.0f;
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
