//
//  ContactsViewController.m
//  ContaktMe
//
//  Created by Riyad Anabtawi on 2/11/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import "PrivacyViewController.h"
#import "Functions.h"
#import "SWRevealViewController.h"

@interface PrivacyViewController (){
    Privacy *_editablePrivacy;
    
}

@end

@implementation PrivacyViewController


-(void)selectedUser:(User *)user{}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self slideMenuSetup];
    
    
    Privacy *user0=[Privacy new];
    user0.name=@"Position";
    user0.category=@"Choose to share or not";
    user0.sharable=NO;
    
    Privacy *user1=[Privacy new];
    user1.name=@"Followed by";
    user1.category=@"Choose to share or not";
    user1.sharable=YES;
    
    Privacy *user2=[Privacy new];
    user2.name=@"Status Message";
    user2.category=@"Choose to share or not";
    user2.sharable=YES;
    Privacy *user3=[Privacy new];
    user3.name=@"Birth Place";
    user3.sharable=NO;
    user3.category=@"Choose to share or not";
    
    
    
    
    Privacy *user4=[Privacy new];
    user4.name=@"Profession";
    user4.category=@"Edit personal info";
    
    Privacy *user5=[Privacy new];
    user5.name=@"Mobile Phone";
    user5.category=@"Edit personal info";
    
    
    Privacy *user6=[Privacy new];
    user6.name=@"Email";
    user6.category=@"Edit personal info";
    
    Privacy *user7=[Privacy new];
    user7.name=@"Position";
    user7.category=@"Edit personal info";
    
    Privacy *user8=[Privacy new];
    user8.name=@"Birth Place";
    user8.category=@"Edit personal info";
    
    Privacy *user9=[Privacy new];
    user9.name=@"Status Message";
    user9.category=@"Edit personal info";
    
    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    
    logo.clipsToBounds = YES;
    logo.contentMode = UIViewContentModeScaleAspectFit;
    
    logo.frame=CGRectMake(logo.frame.origin.x, logo.frame.origin.y, 140, 20);
    UIView *logoContainer = [[UIView alloc] initWithFrame:logo.frame];
    [logoContainer addSubview:logo];
    
    self.navigationItem.titleView = logoContainer;
    self.navigationItem.leftBarButtonItem.title = @"";
    self.navigationController.navigationBar.topItem.title = @"";

    
    
    self.privacyOptions = [NSArray arrayWithObjects:user1,user0,user2,user3,user4,user5,user6,user7,user8,user9, nil];
    self.privacyDick = [NSMutableDictionary new];
    
    for ( Privacy* u in self.privacyOptions ) {
        
        if ( ![self.privacyDick objectForKey:u.category] ) {
            [self.privacyDick setObject:[NSMutableArray new] forKey:u.category];
        }
        
        [[self.privacyDick objectForKey:u.category] addObject:u];
    }
    
    
    [self.allPrivacyTable registerNib:[UINib nibWithNibName:@"ContactListViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"contactcell"];
    
    
    [self.allPrivacyTable reloadData];
    
    // Do any additional setup after loading the view.
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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    
    NSArray *cats = [_privacyDick allKeys];
    return [[_privacyDick objectForKey:[cats objectAtIndex:section]] count];
    
    
    
    
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    
    NSArray *cats = [_privacyDick allKeys];
    
    return [cats count];
    
    
    
    
    
    
    
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSArray *cats = [_privacyDick allKeys];
    
    NSString *label=[cats objectAtIndex:section];
    
    
    return label;
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    
    
    
    return @" ";
    
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    view.tintColor = [UIColor whiteColor];
    
    // if you have index/header text in your tableview change your index text color
    UITableViewHeaderFooterView *headerIndexText = (UITableViewHeaderFooterView *)view;
    [headerIndexText.textLabel setTextColor:[Functions colorWithHexString:@"3C526C"]];
    [headerIndexText.textLabel setFont:[UIFont fontWithName:FONT_BOLD size:16]];
    
}


-(void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section{
    UITableViewHeaderFooterView *headerIndexText2 = (UITableViewHeaderFooterView *)view;
    
    headerIndexText2.frame=CGRectMake(0, 0, 1, 2);
    view.tintColor =[UIColor clearColor];
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    ContactListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contactcell"];
    
  
    cell.delegate=self;
    NSArray *cats = [_privacyDick allKeys];
    cell.icon_image.hidden=YES;
    Privacy *display =[Privacy new];
    NSString *cat = [cats objectAtIndex:indexPath.section];
    NSArray *users = [_privacyDick objectForKey:cat];
    
    
    cell.request_view.hidden=YES;
    cell.selectedBackgroundView.backgroundColor=[UIColor clearColor];
   
    
    

    
 
    cell.line1.hidden=YES;
    cell.line2.hidden=YES;
    cell.mainView.layer.borderColor=[[Functions colorWithHexString:@"2D3E4F"] CGColor];
    cell.mainView.backgroundColor=[UIColor whiteColor];
    cell.mainView.layer.borderWidth=1.0f;
    cell.userName.textColor=[Functions colorWithHexString:@"2D3E4F"];
       cell.cellWidth.constant=self.view.frame.size.width-10;
    
    display=[users objectAtIndex:indexPath.row];
    NSString *string=display.name;
     BOOL sharable=display.sharable;
    [cell displayPrivacy:string andImage:@""];
    if(indexPath.section==0){
         cell.CheckorNot.hidden=NO;
        if(sharable){
            cell.CheckorNot.image=[UIImage imageNamed:@"check_green_icon.png"];
        
        }else{
        
            cell.CheckorNot.image=[UIImage imageNamed:@"cross_red_icon.png"];
        }
        
        
    }else{
        cell.CheckorNot.hidden=YES;
        
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
    
    
    
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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    _editablePrivacy =[Privacy new];
    _editablePrivacy=[_privacyOptions objectAtIndex:indexPath.row];
    
    
    if(indexPath.section==0){
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Want to share %@?",_editablePrivacy.name]
                                                          message:nil
                                                         delegate:self
                                                cancelButtonTitle:@"YES"
                                                otherButtonTitles:@"NO",nil];
        
;
        
        [message show];
    
    }else{
    
    
    }
}

-(void)removeView{
    

    
    
}
-(void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    // call service  to share editablePrivacy.name pick _editablePrivacy and turn shareble BOOL to yes or no
    if (buttonIndex==0) {

        
        [_allPrivacyTable reloadData];
        
   
  
    } else if(buttonIndex==1){
           [_allPrivacyTable reloadData];
    }
}
-(void)Sad:(User *)user{}


-(void)Happy:(User *)user{}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


@end
