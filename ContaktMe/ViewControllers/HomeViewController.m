//
//  HomeViewController.m
//  BeepGoosh
//
//  Created by Riyad Anabtawi on 1/11/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import "HomeViewController.h"
#import "Functions.h"
#import "ContactsViewController.h"
#import "SearchUserViewController.h"
#import "SearchViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController{
    SearchViewController *_search;
    SBTVProgramPreview *preview;
        SBTVProgramPreview *previewSingle;
  VODFilterLevel3 *level3Filter;
}

-(void)ShowDrag{


}

- (void)viewDidLoad {
        [[self navigationController] setNavigationBarHidden:NO animated:NO];
//    for (NSString *familyName in [UIFont familyNames]) {
//        for (NSString *fontName in [UIFont fontNamesForFamilyName:familyName]) {
//            NSLog(@"%@", fontName);
//        }
//    }
    self.topAddView.constant=self.topAddView.constant=1000;
    [self.view layoutIfNeeded];
    [super viewDidLoad];
    
  

    self.view.backgroundColor=[Functions colorWithHexString:@"fff"];

    self.blockUIview.alpha=0.0f;
    [self.view layoutIfNeeded];

    


    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    
    logo.clipsToBounds = YES;
    logo.contentMode = UIViewContentModeScaleAspectFit;
    
    logo.frame=CGRectMake(logo.frame.origin.x, logo.frame.origin.y, 140, 17);
    UIView *logoContainer = [[UIView alloc] initWithFrame:logo.frame];
    [logoContainer addSubview:logo];
    
    self.navigationItem.titleView = logoContainer;
    self.navigationItem.leftBarButtonItem.title = @"";
    _emailDestiny.font=[UIFont fontWithName:FONT_REGULAR size:_emailDestiny.font.pointSize];
    _doneButtonAdd.titleLabel.font=[UIFont fontWithName:FONT_REGULAR size:_doneButtonAdd.titleLabel.font.pointSize];
     [self.emailDestiny setValue:[UIFont fontWithName:FONT_LIGHT size: 14] forKeyPath:@"_placeholderLabel.font"];
    self.doneButtonAdd.titleLabel.font=[UIFont fontWithName:FONT_BOLD size:16];
    User *user0=[User new];
    user0.name=@"Anan Anabtawi";
    user0.status_message=@"On Vacation";
    user0.city=@"Dana Point";
    user0.avatar=@"emrie.jpg";
    user0.followed_by=@200;
    user0.state=@"online";
    user0.profession=@"Industrial Engineer";
    user0.mobilephone=@"+011-949-4113667";
    user0.birthPlace=@"Palestine";
    user0.workplace=@"CEO @ContaktMe";
    user0.email=@"anan@gmail.com";
    user0.country=@"USA";
    user0.category=@"Family";
    
    
    User *user1=[User new];
    user1.name=@"Adnan Anabtawi";
    user1.status_message=@"At Work";
    user1.city=@"Amman";
    user1.avatar=@"adnan.png";
    user1.state=@"busy";
    user1.followed_by=@120;
    user1.birthPlace=@"Palestine";
    user1.profession=@"Photographer";
    user1.mobilephone=@"+611-949-4113667";
    user1.workplace=@"CEO @ContaktMe";
    user1.email=@"adnan@gmail.com";
    user1.country=@"Jordan";
    user1.category=@"Family";
    
    
    
    User *user2=[User new];
    user2.name=@"Alberto Maluje";
    user2.city=@"Santiago";
    user2.status_message=@"Beach day @Valparaiso";
    user2.followed_by=@67;
    user2.avatar=@"albert.png";
    user2.state=@"online";
    user2.category=@"Work";
    user2.birthPlace=@"Chile";
    user2.profession=@"Software Engineer";
    user2.mobilephone=@"+56-57778789";
    user2.workplace=@"@ContaktMe";
    user2.email=@"amaluje@gmail.com";
    user2.country=@"Chile";
    user2.category=@"Work";
    
    
    User *user3=[User new];
    user3.name=@"Franklin Cruz";
    user3.followed_by=@3;
    user0.status_message=@"What we do in life, echoes in eternity";
    user3.city=@"Santiago";
    user3.avatar=@"frank.png";
    user3.state=@"online";
    user3.profession=@"IT Engineer";
    user3.mobilephone=@"+56-9-59467288";
    user3.workplace=@"@ContaktMe";
    user3.email=@"fcruz@gmail.com";
    user3.country=@"Chile";
    user3.birthPlace=@"Salvador";
    user3.category=@"Work";
    
    
    User *user4=[User new];
    user4.name=@"Farid Kasm";
    user4.status_message=@"South America!";
    user4.city=@"New Port";
    user4.birthPlace=@"Lebanon";
    user4.followed_by=@100;
    user4.avatar=@"farid.png";
    user4.country=@"USA";
    user4.state=@"offline";
    user4.profession=@"IT Engineer";
    user4.mobilephone=@"+56-67542321";
    user4.workplace=@"@ContaktMe";
    user4.email=@"fkasm@gmail.com";
    user4.category=@"Family";
    
    
    User *user5=[User new];
    user5.name=@"Isaac Kaufman";
    user5.status_message=@"@Caesars Palace, Las Vegas";
    user5.birthPlace=@"USA";
    user5.followed_by=@57;
    user5.city=@"Laguna Nigel";
    user5.avatar=@"isaac.png";
    user5.state=@"offline";
    user5.profession=@"Jewlery Designer";
    user5.mobilephone=@"+011-949-4123619";
    user5.workplace=@"CEO GMS Beverly Hills";
    user5.email=@"ikaufman@gmail.com";
    user5.country=@"USA";
    user5.category=@"Friends";
    
    
    self.contacts = [NSArray arrayWithObjects:user1,user0,user2,user3,user4,user5, nil];
    
    //Right Button
    
    
    preview = [[SBTVProgramPreview alloc] init];
    
    
    preview.delegate=self;
    preview.controller=self;
    [preview setPrograms:self.contacts WithSelectedProgram:user1];
    
    
    [Functions fillContainerView:self.view WithView:preview];
    
   
    [Functions fillContainerView:preview WithView:self.addUserView];
    
    
    UIWindow *frontWindow = [[UIApplication sharedApplication] keyWindow];
    
    [Functions fillContainerView:frontWindow.subviews[0] WithView:self.Dissapear];

    

    
      [Functions fillContainerView:self.view WithView:self.blockUIview];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        [self hideFilterLayer];
    
    if([segue.identifier isEqualToString:@"shareMe"]){
        ShareContactViewController *controller = segue.destinationViewController;
        controller.delegate=self;
        
        
    }
    if([segue.identifier isEqualToString:@"ShowJobOffer"]){
 
        
    }
    
    if([segue.identifier isEqualToString:@"nearbyJobs"]){
       
        
        
    }
    
   
    if([segue.identifier isEqualToString:@"Privacy"]){
    
    
    
    }else if([segue.identifier isEqualToString:@"Contacts"]){
    
        ContactsViewController *controller =segue.destinationViewController;
        controller.contacts=self.contacts;
        
    }else if([segue.identifier isEqualToString:@"Logout"]){
    
    
    }
    if([segue.identifier isEqualToString:@"Settings"]){
    
      //  SettingsViewController *controller=segue.destinationViewController;
        
    
    }
    
    if([segue.identifier isEqualToString:@"Block user"]){
        
        //  SettingsViewController *controller=segue.destinationViewController;
        
        
    }
    
    
     if([segue.identifier isEqualToString:@"SearchPros"]){
         _search=segue.destinationViewController;
         _search.isSearchingOffers=NO;
         _search.isSearchingProfessionals=YES;
    
    }
    
    
    if([segue.identifier isEqualToString:@"SearchJobs"]){
    
        _search=segue.destinationViewController;
        _search.isSearchingOffers=YES;
        _search.isSearchingProfessionals=NO;
    }
    
}



-(void)viewDidAppear:(BOOL)animated {

 
    self.navigationItem.backBarButtonItem.tintColor=[UIColor whiteColor];
    
    [self slideMenuSetup];

}

-(void) revealController:(SWRevealViewController *)revealController animateToPosition:(FrontViewPosition)position{



    
    if (position == FrontViewPositionLeft) {
        
        self.blockUIview.alpha = .4f;
        [UIView animateWithDuration:0.5 animations:^{
            self.blockUIview.alpha = 0.0f;
            
            
            
        } completion:^(BOOL finished) {
            
        }];
        
    }
    if (position == FrontViewPositionRight) {
        self.blockUIview.alpha = 0.0;
        [UIView animateWithDuration:0.5 animations:^{
            self.blockUIview.alpha = .4f;
            
            
            
        } completion:^(BOOL finished) {
            
        }];
    }


}
- (void) revealController:(SWRevealViewController *)revealController didMoveToPosition:(FrontViewPosition)position {
    
//    
//    if (position == FrontViewPositionLeft) {
//        
//          self.blockUIview.alpha = 0.4f;
//        [UIView animateWithDuration:0.5 animations:^{
//          self.blockUIview.alpha = 0.0f;
//            
//            
//            
//        } completion:^(BOOL finished) {
//            
//        }];
//      
//    }
//    if (position == FrontViewPositionRight) {
//        self.blockUIview.alpha = 0.0;
//        [UIView animateWithDuration:0.5 animations:^{
//            self.blockUIview.alpha = 0.4f;
//            
//            
//            
//        } completion:^(BOOL finished) {
//            
//        }];
//    }
}

- (void)slideMenuSetup
{
    UIButton *menuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 13)];
      UIImageView *logo2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    UIButton *settingsButton = [[UIButton alloc] initWithFrame:CGRectMake(logo2.frame.origin.x, logo2.frame.origin.y, 20, 20)];
    
    [menuButton setBackgroundImage:[UIImage imageNamed:@"icon_menu.png"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    
    [settingsButton setBackgroundImage:[UIImage imageNamed:@"settings_icon.png"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:settingsButton];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        revealViewController.delegate = self;
        revealViewController.toggleAnimationDuration=1;
            revealViewController.rearViewRevealWidth=240;
     
        
        SlideMenuViewController *menu = (SlideMenuViewController *)revealViewController.rearViewController;
        menu.delegate = self;
        
        [settingsButton addTarget:self action:@selector( showSettings: ) forControlEvents:UIControlEventTouchUpInside];
        [menuButton addTarget:self action:@selector( showSlideMenu: ) forControlEvents:UIControlEventTouchUpInside];
        [self.navigationController.navigationBar addGestureRecognizer: self.revealViewController.panGestureRecognizer];
    }
}
-(void)showSlideMenu:(id)sender{
    [self hideFilterLayer];
    SWRevealViewController *revealViewController = self.revealViewController;
    [revealViewController revealToggleAnimated:YES];
    

}
-(void)showSettings{

[self performSegueWithIdentifier:@"Settings" sender:self];

}




-(void)acceptPendingUser:(User *)user{



}


-(void)refusePendingUser:(User *)user{



}

-(void)addNewUser{



}



-(IBAction)tapblockUItohideSlideMenu:(id)sender{

       [self hideFilterLayer];
    SWRevealViewController *revealViewController = self.revealViewController;
   
    self.blockUIview.alpha=0.0f;
    
        if ( revealViewController )
        {
            [revealViewController revealToggle:self];
        }



}

-(void)goback{


}






//
//
//
//-(IBAction)SendVoice:(id)sender{
//
//    if([self.user.state isEqualToString:@"online"]){
//        
//        
//    }else if([self.user.state isEqualToString:@"offline"]||[self.user.state isEqualToString:@"busy"]){
//        
//        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Sorry!"
//                                                          message:@"You cant send a voice message if the contactis offline or currently busy-"
//                                                         delegate:nil
//                                                cancelButtonTitle:@"OK"
//                                                otherButtonTitles:nil];
//        
//        
//        [message show];
//    }
//
//}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    

    [UIView animateWithDuration:0.5 animations:^{
        
        self.addUserView.alpha=0.0f;
        
        
    } completion:^(BOOL finished) {
        
    }];
    

    return YES;
}
-(void)showSettings:(id)sender{

    [self performSegueWithIdentifier:@"Settings" sender:self];
}





- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


-(IBAction)shareImage:(id)sender{



}




-(void)SelectedOption:(NSString *)string{
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [revealViewController revealToggle:self];
    }
    
    
 
    [self performSegueWithIdentifier:string sender:self];
    
    
    

}




-(void)removeView{
    previewSingle.alpha=1;
    [UIView animateWithDuration:0.5 animations:^{
        previewSingle.alpha=0;
        
        
        previewSingle=nil;
        
    } completion:^(BOOL finished) {
        
    }];
    
    
}




-(void)showAddview{
    [self hideFilterLayer];
    SWRevealViewController *revealViewController = self.revealViewController;
    
    if ( revealViewController )
    {
        [revealViewController revealToggle:self];
    }
    [UIView animateWithDuration:0.7 animations:^{
        
        self.topAddView.constant=0;
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
    }];


}

-(IBAction)hideAddview:(id)sender{
 [_emailDestiny resignFirstResponder];

    [UIView animateWithDuration:0.5 animations:^{
        
        self.topAddView.constant=1000;
        [self.view layoutIfNeeded];
        
        
    } completion:^(BOOL finished) {
        
    }];
}

-(void)selectedLogOut{
      SWRevealViewController *revealViewController = self.revealViewController;
//    [[FBSession activeSession] closeAndClearTokenInformation];
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    
//    //TODO: Are other keys needed to be removed
//    [defaults removeObjectForKey:@"id"];
//    [defaults removeObjectForKey:@"ServiceTimer"];
//    [defaults removeObjectForKey:@"equipoFavorito"];
//    [defaults removeObjectForKey:@"equipoSeguiendo"];
//    [defaults removeObjectForKey:CHECKUSER_TVKEY];
//    [defaults removeObjectForKey:CHECKUSER_SMARTPHONEKEY];
//    
//    [defaults synchronize];
    
    if ( revealViewController )
    {
        [revealViewController revealToggle:self];
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];

}
-(void)vodFilterDisplayThirdLevel:(NSArray *)filter andType:(NSString *)type{

    if([type isEqualToString:@"search"]){
    
        if (level3Filter != nil) {
            
            [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
                
                CGRect frame = level3Filter.frame;
                frame.origin.x = frame.origin.x - frame.size.width;
                frame.origin.y=40;
                level3Filter.frame = frame;
                
            } completion:^(BOOL finished) {
                
                
                [level3Filter removeFromSuperview];
                level3Filter = nil;
                
                [self displayNewLeve3Filter:filter andType:type];
            }];
            
        }else{
            
            [self displayNewLeve3Filter:filter andType:type];
        }
        

    
    }else   if([type isEqualToString:@"projects"]){
        
        if (level3Filter != nil) {
            
            [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
                
                CGRect frame = level3Filter.frame;
                frame.origin.x = frame.origin.x - frame.size.width;
                frame.origin.y=40;
                level3Filter.frame = frame;
                
            } completion:^(BOOL finished) {
                
                
                [level3Filter removeFromSuperview];
                level3Filter = nil;
                
                [self displayNewLeve3Filter:filter andType:type];
            }];
            
        }else{
            
            [self displayNewLeve3Filter:filter andType:type];
        }
        
        
        
    }
    
    
    else{
    
        if (level3Filter != nil) {
            
            [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
                
                CGRect frame = level3Filter.frame;
                frame.origin.x = frame.origin.x - frame.size.width;
                frame.origin.y=40;
                level3Filter.frame = frame;
                
            } completion:^(BOOL finished) {
                
                
                [level3Filter removeFromSuperview];
                level3Filter = nil;
                
                [self displayNewLeve3Filter:filter andType:type];
            }];
            
        }else{
        
                [self displayNewLeve3Filter:filter andType:type];
        }
        

    }
    



}


-(void)displayNewLeve3Filter:(NSArray *)filter andType:(NSString *)type {
    
    VODFilterLevel3 *newVodfilterLevel3 = [VODFilterLevel3 createWithFilter:filter andType:type];
    
    level3Filter = newVodfilterLevel3;
    newVodfilterLevel3.delegate = self;
    CGRect frame = newVodfilterLevel3.frame;
    frame.origin.x = -105;
    frame.origin.y = 40;
    frame.size.height = self.view.frame.size.height;
    
    newVodfilterLevel3.frame = frame;
    
    
    
    [self.view addSubview:newVodfilterLevel3];
 
    [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
        
        CGRect frame = newVodfilterLevel3.frame;
        frame.origin.x = 0;
        frame.origin.y=40;
        
        newVodfilterLevel3.frame = frame;
        
    } completion:^(BOOL finished) {
        
    }];
    
}


-(void)hideFilterLayer{
    
    [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
        
        CGRect frame = level3Filter.frame;
        frame.origin.x = -100;
        frame.origin.y=40;
        level3Filter.frame = frame;
        
    } completion:^(BOOL finished) {
        
        
        [level3Filter removeFromSuperview];
        level3Filter.delegate = nil;
        level3Filter = nil;
    }];
    
    
}



-(void)displayUser:(User *)user{

    [self hideFilterLayer];
    [previewSingle removeFromSuperview];
    previewSingle=nil;
    previewSingle = [[SBTVProgramPreview alloc] init];
    
    
    previewSingle.delegate=self;
    previewSingle.controller=self;
    [previewSingle setPrograms:[NSArray arrayWithObject:user] WithSelectedProgram:user];
    
    [Functions fillContainerView:self.view WithView:previewSingle];
    SWRevealViewController *revealViewController = self.revealViewController;
    
    if ( revealViewController )
    {
        [revealViewController revealToggle:self];
    }
    [self viewDidAppear:YES];


}

-(void)backToHome{
  [self hideFilterLayer];
    [self hideFilterLayer];
    [previewSingle removeFromSuperview];
    previewSingle=nil;
  [self hideMenu];
    
    [self hideAddview:self];


}



-(void)displaySearchProf{
  [self hideMenu];

    [self performSegueWithIdentifier:@"SearchPros" sender:self];

}


-(void)displaySearchJobs{
  [self hideMenu];

    [self performSegueWithIdentifier:@"SearchJobs" sender:self];

}


-(void)goToSettings{
  [self hideMenu];

    [self performSegueWithIdentifier:@"Settings" sender:self];
}




-(void)hideMenu{

    SWRevealViewController *revealViewController = self.revealViewController;
    
    self.blockUIview.alpha=0.0f;
    
    if ( revealViewController )
    {
        [revealViewController revealToggle:self];
    }
}


-(void)displayNearbyJobs{

    [self hideMenu];
    
    [self performSegueWithIdentifier:@"nearbyJobs" sender:self];

}


-(void)userSelectedJob{

 [self hideMenu];
    [self hideFilterLayer];
    
    [self performSegueWithIdentifier:@"ShowJobOffer" sender:self];

}


-(void)displayAlertToAcceptUser:(User *)user{

          UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Hmmm"message:[NSString stringWithFormat:@"Do you whish to  accept or deny \n %@",user.name]delegate:nil cancelButtonTitle:@"ACCEPT"otherButtonTitles:@"DENY",nil];[message show];


}
@end

