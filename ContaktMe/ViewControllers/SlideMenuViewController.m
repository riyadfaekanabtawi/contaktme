//
//  SlideMenuViewController.m
//  ContaktMe
//
//  Created by Riyad Anabtawi on 1/21/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import "SlideMenuViewController.h"
#import "Functions.h"
#import "VODFilterLevel3.h"
@interface SlideMenuViewController ()

@end

@implementation SlideMenuViewController{

 VODFilterLevel3 *level3Filter;
    NSArray *_SearchOptions;
    NSArray *_projects;
    Project *_project;
   
}

- (void)viewDidLoad {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [super viewDidLoad];
    self.logout.alpha=0.0f;
    self.onlineUsers.alpha=0.0f;
     self.nearbyOffersview.alpha=0.0f;
    self.pendingRequests.alpha=0.0f;
    self.allContacts.alpha=0.0f;
    self.allProjectsview.alpha=0.0f;
    self.chats.alpha=0.0f;
    self.home.alpha=1.0f;
    self.privacy.alpha=0.0f;
    self.blcok.alpha=0.0f;
   self.search.alpha=0.0f;
   
    
 
    

    self.panelLabel.font=[UIFont fontWithName:FONT_BOLD size:self.panelLabel.font.pointSize];
    self.userName.font=[UIFont fontWithName:FONT_LIGHT size:self.userName.font.pointSize];
    self.homeLabel.font=[UIFont fontWithName:FONT_LIGHT size:self.homeLabel.font.pointSize];
    self.onlinUsersLabel.font=[UIFont fontWithName:FONT_LIGHT size:self.onlinUsersLabel.font.pointSize];
    self.pendingLabel.font=[UIFont fontWithName:FONT_LIGHT size:self.pendingLabel.font.pointSize];
    self.allcontaktsLabel.font=[UIFont fontWithName:FONT_LIGHT size:self.allcontaktsLabel.font.pointSize];
    self.chatsLabel.font=[UIFont fontWithName:FONT_LIGHT size:self.chatsLabel.font.pointSize];
    self.privacyLabel.font=[UIFont fontWithName:FONT_LIGHT size:self.privacyLabel.font.pointSize];
    self.AllProjectsLabel.font=[UIFont fontWithName:FONT_LIGHT size:self.AllProjectsLabel.font.pointSize];
    self.blockLabel.font=[UIFont fontWithName:FONT_LIGHT size:self.blockLabel.font.pointSize];
    self.searchLocationLabel.font=[UIFont fontWithName:FONT_LIGHT size:self.searchLocationLabel.font.pointSize];
    self.LogoutLabel.font=[UIFont fontWithName:FONT_LIGHT size:self.LogoutLabel.font.pointSize];
    self.sectionLabel.font=[UIFont fontWithName:FONT_BOLD size:self.sectionLabel.font.pointSize];
    
    
    
    self.userAvatar.layer.cornerRadius = self.userAvatar.frame.size.width / 2;
    self.userAvatar.clipsToBounds = YES;
  self.mainScrollHeight.constant=self.view.frame.size.height+80;
    
    [self.contactTableView registerNib:[UINib nibWithNibName:@"VODFilterLevel1Cell"
                                                          bundle:[NSBundle mainBundle]]
                    forCellReuseIdentifier:@"VODFilterLevel1Cell"];
    self.mainView.backgroundColor=[Functions colorWithHexString:@"2d3e4f"];
    
    self.user=[User new];
    self.user.user_id=@"1";
    _SearchOptions=@[@"For Jobs",@"For Professionals"];
    _projects=@[@"Mobile iOS Dev",@"UI-X Designer"];
    _configOptions=@[@"Privacy",@"Contacts",@"Chats",@"LogOut",@"Block user"];
    _configIcons=@[@"privacy_icon.png",@"contacts_icon.png",@"chat_menu_icon.png",@"logout_icon.png",@"block_icon.png"];
    
    self.titleMenu.textColor=[Functions colorWithHexString:@"f35e46"];
    self.list.textColor=[Functions colorWithHexString:@"f35e46"];
    self.titleMenu.font=[UIFont fontWithName:FONT_BOLD size:18];
    self.list.font=[UIFont fontWithName:FONT_LIGHT size:18];
    //[self.contactTableView registerNib:[UINib nibWithNibName:@"ContactListViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"contactcell"];
    
    self.userName.text=[NSString stringWithFormat:@"%@",[defaults objectForKey:@"USER_NAME"]];

    
    
    CALayer *layer = self.view.layer;
    layer.shadowOffset = CGSizeMake(1, 1);
    layer.shadowColor = [[UIColor blackColor] CGColor];
    layer.shadowRadius = 2.0f;
    layer.shadowOpacity = 0.25f;
    layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
    
    
    layer = self.topView.layer;
    layer.shadowOffset = CGSizeMake(1, 1);
    layer.shadowColor = [[UIColor blackColor] CGColor];
    layer.shadowRadius = 2.0f;
    layer.shadowOpacity = 0.25f;
    layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
    
    self.contacts=[NSArray new];
    
    [self.contactTableView reloadData];
    
    
    
    
    User *user0=[User new];
    user0.name=@"Anan Anabtawi";
    user0.status_message=@"On Vacation";
    user0.city=@"Dana Point";
    user0.avatar=@"emrie.jpg";
    user0.followed_by=@200;
    user0.state=@"online";
    
          user0.accepted=@"YES";
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
    user1.state=@"online";
    user1.followed_by=@120;
          user1.accepted=@"YES";
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
          user2.accepted=@"YES";
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
          user3.accepted=@"YES";
    user3.profession=@"IT Engineer";
    user3.mobilephone=@"+56-67542321";
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
    user4.accepted=@"NO";
    user4.profession=@"IT Engineer";
    user4.mobilephone=@"+56-67542321";
    user4.workplace=@"@ContaktMe";
    user4.email=@"fkasm@gmail.com";
    user4.category=@"Family";
    
    
    User *user5=[User new];
    user5.name=@"Isaac Kaufman";
        user5.accepted=@"NO";
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
    
    self.AlluserDick=[NSMutableDictionary new];
    
    self.userDick = [NSMutableDictionary new];
    
    for ( User* u in self.contacts ) {
        
        if ( ![self.userDick objectForKey:u.state] ) {
            [self.userDick setObject:[NSMutableArray new] forKey:u.state];
        }
        
        [[self.userDick objectForKey:u.state] addObject:u];
    }
    
    
    for ( User* u in self.contacts ) {
        
        if ( [self.AlluserDick objectForKey:u.accepted] ) {
            [self.AlluserDick setObject:[NSMutableArray new] forKey:u.accepted];
        }
        
        [[self.AlluserDick objectForKey:u.state] addObject:u];
    }
    
    

 

    // Do any additional setup after loading the self.
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(tableView.tag==22){
             NSString *string =[_configOptions objectAtIndex:indexPath.row];
        
        
        if([string isEqualToString:@"LogOut"]){
           
                
            [self.delegate selectedLogOut];
                

        
        
        }else{
            [self.delegate SelectedOption:string];
        
        }
   
    
        
        
    
    }else{
        NSArray *cats = [_userDick allKeys];
      

        NSString *cat = [cats objectAtIndex:indexPath.section];
        NSArray *users = [_userDick objectForKey:cat];
        
   
        User *user = [users objectAtIndex:indexPath.row];
        self.usercontact=[users objectAtIndex:indexPath.row];
        
        
        NSString *label=user.accepted;
 
        if([ label isEqualToString:@"YES"] ){
            
            User *display =[User new];
            NSArray *cats = [_userDick allKeys];
            NSString *cat = [cats objectAtIndex:indexPath.section];
            NSArray *users = [_userDick objectForKey:cat];
            
            
            display=[users objectAtIndex:indexPath.row];
            
            
            
       
            
            //[self.delegate ShowSelectedUser:display];
        }else{
        
        
        
        }

    }
  
    
}





-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if(tableView.tag==22){
    
        return [_configOptions count];
    
    }else{
        NSArray *cats = [_userDick allKeys];
        return [[_userDick objectForKey:[cats objectAtIndex:section]] count];
    
    }
    

    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if(tableView.tag==22){
    
    
        return  1;
    }else{
    
       // NSArray *cats = [_userDick allKeys];
        
        return 1;
    
    }

    
    
    
    
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
 return @"Configuration";
 
}


-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{



return @" ";
    
}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    view.tintColor = [UIColor whiteColor];
    
    // if you have index/header text in your tableview change your index text color
    UITableViewHeaderFooterView *headerIndexText = (UITableViewHeaderFooterView *)view;
    [headerIndexText.textLabel setTextColor:[Functions colorWithHexString:@"f35e46"]];
    [headerIndexText.textLabel setFont:[UIFont fontWithName:FONT_REGULAR size:16]];
    
}
-(void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section{
  UITableViewHeaderFooterView *headerIndexText2 = (UITableViewHeaderFooterView *)view;
    
    headerIndexText2.frame=CGRectMake(0, 0, 1, 1);
    view.tintColor =[UIColor clearColor];

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    

    
    
    if(tableView.tag==22){
        ContactListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contactcell"];
        cell.delegate=self;
      
        cell.line1.hidden=NO;
        cell.line2.hidden=NO;
        cell.icon_image.hidden=NO;
        NSString *string = [_configOptions objectAtIndex:indexPath.row];
        NSString *stringImage = [_configIcons objectAtIndex:indexPath.row];
        [cell displayLabel:string andImage:stringImage];
      cell.mainView.backgroundColor=[UIColor clearColor];
        cell.request_view.hidden=YES;
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
        
        
    }else{
        
        ContactListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contactcell"];
        cell.delegate=self;
        NSArray *cats = [_userDick allKeys];
             cell.icon_image.hidden=YES;
        User *display =[User new];
        NSString *cat = [cats objectAtIndex:indexPath.section];
        NSArray *users = [_userDick objectForKey:cat];
        
                    cell.request_view.hidden=YES;
        
        cell.selectedBackgroundView.backgroundColor=[UIColor clearColor];
        User *user = [users objectAtIndex:indexPath.row];
        self.usercontact=[users objectAtIndex:indexPath.row];
        
        
        NSString *label=user.accepted;
        cell.line1.hidden=YES;
        cell.line2.hidden=YES;
        if([ label isEqualToString:@"YES"] ){
            cell.userName.textColor=[Functions colorWithHexString:@"3C526C"];
            cell.mainView.layer.borderColor=[[Functions colorWithHexString:@"f35e46"] CGColor];
            cell.mainView.backgroundColor=[UIColor whiteColor];
            cell.mainView.layer.borderWidth=1.0f;
            cell.state_view.backgroundColor=[Functions colorWithHexString:@"1d9c30"];
            cell.request_view.hidden=YES;
        }else{
              cell.request_view.hidden=NO;
          
        
            cell.mainView.layer.borderColor=[[Functions colorWithHexString:@"f35e46"] CGColor];
            cell.mainView.backgroundColor=[UIColor whiteColor];
            cell.mainView.layer.borderWidth=1.0f;
             cell.userName.textColor=[Functions colorWithHexString:@"3C526C"];
             // cell.mainView.backgroundColor=[Functions colorWithHexString:@"2d3e4f"];
            
        }
        
        
        display=[users objectAtIndex:indexPath.row];
        
        [cell displayUser:display];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
        
   
    }

}




-(void)selectedUser:(User *)user{
    
    
    //[self.delegate ShowSelectedUser:user];
    
}


-(IBAction)addUser:(id)sender{


    [self.delegate showAddview];

}

-(void)Happy:(User *)user{


 //   [self.delegate happy:user];
}


-(void)Sad:(User *)user{
  // [self.delegate sad:user];
}




-(IBAction)onlineUsers:(id)sender{
   
    [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
        self.home.alpha=0.0f;
        self.onlineUsers.alpha=1.0f;
        self.pendingRequests.alpha=0.0f;
         self.allProjectsview.alpha=0.0f;
        self.allContacts.alpha=0.0f;
        self.chats.alpha=0.0f;
         self.nearbyOffersview.alpha=0.0f;
        self.search.alpha=0.0f;
        self.privacy.alpha=0.0f;
        self.blcok.alpha=0.0f;
        self.logout.alpha=0.0f;
        NSArray *onlineArray = [self.userDick objectForKey:@"online"];
        
        [self.delegate vodFilterDisplayThirdLevel:onlineArray andType:@"Online"];
        
    } completion:^(BOOL finished) {
        
    }];
}

-(IBAction)pendingRequests:(id)sender{


   
    [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
        self.home.alpha=0.0f;
        self.onlineUsers.alpha=0.0f;
         self.allProjectsview.alpha=0.0f;
        self.pendingRequests.alpha=1.0f;
        self.allContacts.alpha=0.0f;
        self.chats.alpha=0.0f;
        self.privacy.alpha=0.0f;
        self.blcok.alpha=0.0f;
        self.logout.alpha=0.0f;
         self.nearbyOffersview.alpha=0.0f;
        self.search.alpha=0.0f;
        NSArray *offline = [self.userDick objectForKey:@"offline"];
        
        if([offline count]==0){
        
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Sorry!"message:@"You cant send a voice message if the contactis offline or currently busy-" delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil];[message show];

        }else{
           [self.delegate vodFilterDisplayThirdLevel:offline andType:@"offline"];
        
        }
     
        
    } completion:^(BOOL finished) {
        
    }];
}


-(IBAction)allContacts:(id)sender{

   
    [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
        self.home.alpha=0.0f;
        self.onlineUsers.alpha=0.0f;
        self.pendingRequests.alpha=0.0f;
        self.allContacts.alpha=1.0f;
         self.nearbyOffersview.alpha=0.0f;
        self.chats.alpha=0.0f;
        self.privacy.alpha=0.0f;
         self.allProjectsview.alpha=0.0f;
        self.blcok.alpha=0.0f;
        self.logout.alpha=0.0f;
        self.search.alpha=0.0f;
         [self.delegate SelectedOption:@"All"];
        
    } completion:^(BOOL finished) {
        
    }];
}

-(IBAction)chats:(id)sender{
 
    
    [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
        self.chats.alpha=1.0f;
        self.home.alpha=0.0f;
        self.onlineUsers.alpha=0.0f;
        self.pendingRequests.alpha=0.0f;
         self.nearbyOffersview.alpha=0.0f;
        self.allContacts.alpha=0.0f;
        self.search.alpha=0.0f;
        self.privacy.alpha=0.0f;
         self.allProjectsview.alpha=0.0f;
        self.blcok.alpha=0.0f;
        self.logout.alpha=0.0f;
        [self.delegate SelectedOption:@"Chats"];
        
        
    } completion:^(BOOL finished) {
        
    }];
}

-(IBAction)privacy:(id)sender{




    [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
        self.home.alpha=0.0f;
        self.onlineUsers.alpha=0.0f;
        self.pendingRequests.alpha=0.0f;
        self.allContacts.alpha=0.0f;
        self.chats.alpha=0.0f;
        self.privacy.alpha=1.0f;
        self.blcok.alpha=0.0f;
         self.allProjectsview.alpha=0.0f;
        self.search.alpha=0.0f;
        self.logout.alpha=0.0f;
        [self.delegate SelectedOption:@"Privacy"];

        
    } completion:^(BOOL finished) {
        
    }];

}


-(IBAction)blockUser:(id)sender{


    [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
        
        self.blcok.alpha=1.0f;
        self.onlineUsers.alpha=0.0f;
        self.pendingRequests.alpha=0.0f;
        self.allContacts.alpha=0.0f;
        self.chats.alpha=0.0f;
        self.privacy.alpha=0.0f;
         self.nearbyOffersview.alpha=0.0f;
        self.search.alpha=0.0f;
         self.allProjectsview.alpha=0.0f;
        self.logout.alpha=0.0f;
        self.home.alpha=0.0f;
        [self.delegate SelectedOption:@"Block user"];
        
    } completion:^(BOOL finished) {
        
    }];
}

-(IBAction)searchbyLocation:(id)sender{
    
    [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
        self.logout.alpha=0.0f;
        self.search.alpha=1.0f;
         self.allProjectsview.alpha=0.0f;
        self.onlineUsers.alpha=0.0f;
        self.pendingRequests.alpha=0.0f;
        self.allContacts.alpha=0.0f;
        self.chats.alpha=0.0f;
        self.privacy.alpha=0.0f;
         self.nearbyOffersview.alpha=0.0f;
        self.blcok.alpha=0.0f;
        self.home.alpha=0.0f;
 [self.delegate vodFilterDisplayThirdLevel:_SearchOptions andType:@"search"];
        
        
    } completion:^(BOOL finished) {
        
    }];
    
    
    
}


-(IBAction)allProjects:(id)sender{
    
    [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
        self.logout.alpha=0.0f;
         self.allProjectsview.alpha=1.0f;
        self.search.alpha=0.0f;
        self.onlineUsers.alpha=0.0f;
        self.pendingRequests.alpha=0.0f;
        self.allContacts.alpha=0.0f;
         self.nearbyOffersview.alpha=0.0f;
        self.chats.alpha=0.0f;
        self.privacy.alpha=0.0f;
        self.blcok.alpha=0.0f;
        self.home.alpha=0.0f;
        [self.delegate vodFilterDisplayThirdLevel:_projects andType:@"projects"];

        
    } completion:^(BOOL finished) {
        
    }];
    
    
    
}
-(IBAction)logout:(id)sender{
    
    [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
        self.logout.alpha=1.0f;
        self.allProjectsview.alpha=0.0f;
           self.home.alpha=0.0f;
        self.onlineUsers.alpha=0.0f;
        self.pendingRequests.alpha=0.0f;
        self.allContacts.alpha=0.0f;
        self.chats.alpha=0.0f;
        self.privacy.alpha=0.0f;
         self.nearbyOffersview.alpha=0.0f;
        self.blcok.alpha=0.0f;
        
        [self.delegate selectedLogOut];

        
    } completion:^(BOOL finished) {
        
    }];

 

}



-(IBAction)HomeTouchupInside:(id)sender{
    
    [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
        self.home.alpha=1.0f;
        self.logout.alpha=0.0f;
        self.onlineUsers.alpha=0.0f;
        self.pendingRequests.alpha=0.0f;
        self.allContacts.alpha=0.0f;
        self.chats.alpha=0.0f;
        self.privacy.alpha=0.0f;
        self.blcok.alpha=0.0f;
         self.allProjectsview.alpha=0.0f;
         self.nearbyOffersview.alpha=0.0f;
        [self.delegate backToHome];
        
        
    } completion:^(BOOL finished) {
        
    }];
    
    
    
}


-(IBAction)goToSettings:(id)sender{


    [self.delegate goToSettings];

}


-(IBAction)nearbyOffers:(id)sender{

    [UIView animateWithDuration:0.5 delay:0 options:0 animations:^{
        self.home.alpha=1.0f;
        self.logout.alpha=0.0f;
        self.onlineUsers.alpha=0.0f;
        self.pendingRequests.alpha=0.0f;
        self.allContacts.alpha=0.0f;
        self.chats.alpha=0.0f;
        self.privacy.alpha=0.0f;
        self.blcok.alpha=0.0f;
        self.allProjectsview.alpha=0.0f;
        self.nearbyOffersview.alpha=1.0f;
        [self.delegate backToHome];
        
        
    } completion:^(BOOL finished) {
        
    }];

}
@end

