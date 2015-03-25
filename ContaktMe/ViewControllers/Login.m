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
@import CoreLocation;

@interface Login () <CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) NSString *longitude;
@property (strong, nonatomic) NSString *latitude;
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
    
//    _loader =[LoaderView create];
//    [_loader startAnimation];
//    UIWindow *frontWindow = [[UIApplication sharedApplication] keyWindow];
//    
//    [Functions fillContainerView:frontWindow.subviews[0] WithView:_loader];
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

    
    [self.email setValue:[UIFont fontWithName:FONT_LIGHT size: 14] forKeyPath:@"_placeholderLabel.font"];
    [self.fullName setValue:[UIFont fontWithName:FONT_LIGHT size: 14] forKeyPath:@"_placeholderLabel.font"];
    [self.emailRegsiter setValue:[UIFont fontWithName:FONT_LIGHT size: 14] forKeyPath:@"_placeholderLabel.font"];
    [self.passwordRegister setValue:[UIFont fontWithName:FONT_LIGHT size: 14] forKeyPath:@"_placeholderLabel.font"];
    [self.confirmPassword setValue:[UIFont fontWithName:FONT_LIGHT size: 14] forKeyPath:@"_placeholderLabel.font"];
    [self.password setValue:[UIFont fontWithName:FONT_LIGHT size: 14] forKeyPath:@"_placeholderLabel.font"];
    
    [super viewDidLoad];
    
    
    CGRect frameRect = self.email.frame;
    frameRect.size.height = 400;
    self.email.frame = frameRect;
}


- (BOOL)prefersStatusBarHidden {
    return YES;
}
-(void)viewDidDisappear:(BOOL)animated {
    
    [_loader endAnimation];
    [_loader removeFromSuperview];
    
}

-(void)viewDidAppear:(BOOL)animated {

    self.locationManager=[[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    float os_version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (os_version >= 8.000000)
    {
  
        if([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]){
            [self.locationManager requestWhenInUseAuthorization];
            [self.locationManager requestAlwaysAuthorization];
            //and the problem with your code : don't forget to start
            [self.locationManager startUpdatingLocation];
        }else{
           
            //and the problem with your code : don't forget to start
            [self.locationManager startUpdatingLocation];
        }
    }
    else
    {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
              [self.locationManager startUpdatingLocation];
   
        
    }
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
                                                    @""]];
        
        
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

//Asdasddasasd
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
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([Functions NSStringIsValidEmail:self.emailRegsiter.text])
    {
       // NSString * language = [[NSLocale preferredLanguages] objectAtIndex:0];
        [SBTVServices registerUserWithEmail:self.emailRegsiter.text
                                andPassword:self.passwordRegister.text
                                andLanguage:@1
                                  withAppID:client_id
                                 AndHandler:^(id data) {
                                     
                                     [defaults setObject:[[[data objectForKey:@"data"] objectForKey:@"user"] objectForKey:@"id_user"] forKey:@"USER_ID"];
                                     
                                           [defaults setObject:self.passwordRegister.text forKey:@"USER_PASSWORD"];
                                     
                                     [defaults synchronize];
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
                                  
                                         self.loginButton.alpha=1.0f;
                                         
                                         self.registerbutton.alpha=1.0f;
                                     }];
                                     
                                     
                                     
                                     
                                     [SBTVServices LoginUserWithemail:self.emailRegsiter.text
                                                          andpassword:self.passwordRegister.text
                                                           AndHandler:^(id data) {
                                                          
                                                               if([data objectForKey:@"full_name"]==nil){
                                                               
                                                               
                                                               [self performSegueWithIdentifier:@"update" sender:self];
                                                               }else{
                                                             [self performSegueWithIdentifier:@"home" sender:self];
                                                               
                                                               }
                                                               
                                                           } orErrorHandler:^(NSError *err) {
                                                           
                                                           }];
                                 } orErrorHandler:^(NSError *err) {
                                     NSLog(@"%@",err);
                                     
                                 }];

    
    }else{
        [[[UIAlertView alloc] initWithTitle:@"Opps!"
                                    message:@"Email type is not correct, please enter a valid email."
                                   delegate:self
                          cancelButtonTitle:@"Understood!"
                          otherButtonTitles:nil] show];
    
    
    }
    
    
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



-(void)callDeviceService{
    
    _loader = [LoaderView create];
    [_loader startAnimation];
    UIWindow *frontWindow = [[UIApplication sharedApplication] keyWindow];
    
    [Functions fillContainerView:frontWindow.subviews[0] WithView:_loader];
    
    
    NSString *uniqueIdentifier = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    [defaults setObject:[uniqueIdentifier stringByReplacingOccurrencesOfString:@"-" withString:@""] forKey:@"id"];
    
    [defaults setObject:@2 forKey:@"devicetype"];
    [defaults setObject:@"true" forKey:@"device_status"];
    [defaults setObject:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] forKey:@"appversion"];
    
    [defaults synchronize];
    NSDictionary *parameters = @{
                                 @"id" : @"",
                                 //@"access_token": [[[FBSession activeSession] accessTokenData] accessToken],
                                 @"iddevice": [defaults objectForKey:@"id"],
                                 @"device" : [defaults objectForKey:@"tokenPush"],
                                 @"devicetype" : @2,
                                 @"devices_status" : @"true",
                                 @"appversion" : [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
                                 };
    
    NSLog(@"PARAMETROS %@", parameters);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:[SBTVServices getWS:@"login"] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *version=[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        NSString *versionWithoutDots = [version
                                        stringByReplacingOccurrencesOfString:@"." withString:@""];
        
        
        
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        
        
        
        NSNumber * versionOurs = [f numberFromString:versionWithoutDots];
        NSNumber *remoteVersioon =[[[responseObject objectForKey:@"data"] objectForKey:@"version"] objectForKey:@"brand__max"];
        NSInteger v1 = [versionOurs integerValue];
        NSInteger v2 = [remoteVersioon isEqual:[NSNull null]] ? -1 : [remoteVersioon integerValue];
        
        
        if( v1 < v2 ){
            
            [_loader endAnimation];
            [_loader removeFromSuperview];
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Nueva actualización"
                                                              message:@"Existe una nueva versión disponible."
                                                             delegate:self
                                                    cancelButtonTitle:@"Canelar"
                                    
                                                    otherButtonTitles:@"Actualizar", nil];
            
            [message show];
            
            
            return ;
        }
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains
        (NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        
        
        
        
        
        NSString *fileName = [NSString stringWithFormat:@"%@/login.json",
                              documentsDirectory];
        NSError *jsonError = nil;
        
        NSData *TheData = [NSJSONSerialization dataWithJSONObject:responseObject
                                                          options:0
                                                            error:&jsonError];
        
        [[NSFileManager defaultManager] createFileAtPath:fileName
                                                contents:TheData
                                              attributes:nil];
        
      
    
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:[uniqueIdentifier stringByReplacingOccurrencesOfString:@"-" withString:@""] forKey:@"id"];
        [defaults setObject:@"" forKey:@"nombre"];
        
        [defaults setObject:[NSDate date] forKey:@"ServiceTimer"];
        [defaults synchronize];
        
        [_loader endAnimation];
        [_loader removeFromSuperview];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Opps.."
                                                        message:@"There was an error in our server. Please try again in a few minutes. Thank you."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        
        [alert show];
        NSLog(@"Error: %@", error);
        //        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        //        appDelegate.pendingNotification = nil;
        [_loader endAnimation];
        [_loader removeFromSuperview];
    }];
    
    
    
}

#pragma mark - CLself.locationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        self.longitude = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        self.latitude = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        
        [SBTVServices searchNeaLatitude:@""
                           andLongitude:@""
                                forUser:@1
                             AndHandler:^(id users) {
                                 
                             } orErrorHandler:^(NSError *err) {
                                 
                             }];
        
        //Call Service  Location
    }
}
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
        case kCLAuthorizationStatusRestricted:
        case kCLAuthorizationStatusDenied:
        {
            // do some error handling
        }
            break;
        default:{
            [self.locationManager startUpdatingLocation];
        }
            break;
    }
}


- (void)requestAlwaysAuthorization
{
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    // If the status is denied or only granted for when in use, display an alert
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse || status == kCLAuthorizationStatusDenied) {
        NSString *title;
        title = (status == kCLAuthorizationStatusDenied) ? @"Location services are off" : @"Background location is not enabled";
        NSString *message = @"To use background location you must turn on 'Always' in the Location Services Settings";
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                            message:message
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"Settings", nil];
        [alertView show];
    }
    // The user has not enabled any location services. Request background authorization.
    else if (status == kCLAuthorizationStatusNotDetermined) {
        [self.locationManager requestAlwaysAuthorization];
    }
}


@end
