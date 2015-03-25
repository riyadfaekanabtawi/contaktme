//
//  ContactsViewController.m
//  ContaktMe
//
//  Created by Riyad Anabtawi on 2/11/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import "ContactsViewController.h"
#import "Functions.h"
#import "SWRevealViewController.h"

@interface ContactsViewController (){



    SBTVProgramPreview *_preview;
}

@end

@implementation ContactsViewController


-(void)selectedUser:(User *)user{}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
        [self slideMenuSetup];
    
    
    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    
    logo.clipsToBounds = YES;
    logo.contentMode = UIViewContentModeScaleAspectFit;
    
    logo.frame=CGRectMake(logo.frame.origin.x, logo.frame.origin.y, 140, 20);
    UIView *logoContainer = [[UIView alloc] initWithFrame:logo.frame];
    [logoContainer addSubview:logo];
    
    self.navigationItem.titleView = logoContainer;
    self.navigationItem.leftBarButtonItem.title = @"";
    self.navigationController.navigationBar.topItem.title = @"";


    self.userDick = [NSMutableDictionary new];
    
    for ( User* u in self.contacts ) {
        
        if ( ![self.userDick objectForKey:u.category] ) {
            [self.userDick setObject:[NSMutableArray new] forKey:u.category];
        }
        
        [[self.userDick objectForKey:u.category] addObject:u];
    }
    
    
        [self.allContaktsTable registerNib:[UINib nibWithNibName:@"ContactListViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"contactcell"];
    
    
    [self.allContaktsTable reloadData];
    
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
    
    

        NSArray *cats = [_userDick allKeys];
        return [[_userDick objectForKey:[cats objectAtIndex:section]] count];
        

    
    
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    

        
        NSArray *cats = [_userDick allKeys];
        
        return [cats count];
        

    
    
    
    
    
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSArray *cats = [_userDick allKeys];
    
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
        NSArray *cats = [_userDick allKeys];
        cell.icon_image.hidden=YES;
        User *display =[User new];
        NSString *cat = [cats objectAtIndex:indexPath.section];
        NSArray *users = [_userDick objectForKey:cat];
        
        
    cell.request_view.hidden=YES;
        cell.selectedBackgroundView.backgroundColor=[UIColor clearColor];
        User *user = [users objectAtIndex:indexPath.row];
    
        
        
        NSString *label=user.state;
        cell.line1.hidden=YES;
        cell.line2.hidden=YES;
    cell.mainView.layer.borderColor=[[Functions colorWithHexString:@"2D3E4F"] CGColor];
    cell.mainView.backgroundColor=[UIColor whiteColor];
    cell.mainView.layer.borderWidth=1.0f;
           cell.userName.textColor=[Functions colorWithHexString:@"2D3E4F"];
        if([ label isEqualToString:@"online"] ||[ label isEqualToString:@"busy"] ){
            
          
     
            cell.state_view.backgroundColor=[Functions colorWithHexString:@"1d9c30"];
            
        }else{
            
      

            cell.state_view.backgroundColor=[Functions colorWithHexString:@"d60838"];
            
            // cell.mainView.backgroundColor=[Functions colorWithHexString:@"2d3e4f"];
            
        }
    cell.cellWidth.constant=self.view.frame.size.width-10;
    
        display=[users objectAtIndex:indexPath.row];
        
        [cell displayUser:display];
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
    

    User *display =[User new];
        NSArray *cats = [_userDick allKeys];
    NSString *cat = [cats objectAtIndex:indexPath.section];
    NSArray *users = [_userDick objectForKey:cat];
    
    
            display=[users objectAtIndex:indexPath.row];

    
    
    
    _preview = [[SBTVProgramPreview alloc] init];
    
    
    _preview.delegate=self;
    _preview.controller=self;
    [_preview setPrograms:[NSArray arrayWithObject:display] WithSelectedProgram:display];
    
    [Functions fillContainerView:self.view WithView:_preview];
}

-(void)removeView{
    
    _preview.alpha=1;
    [UIView animateWithDuration:0.5 animations:^{
          _preview.alpha=0;
        
       
        _preview=nil;
        
    } completion:^(BOOL finished) {
        
    }];



}

-(void)Sad:(User *)user{}


-(void)Happy:(User *)user{}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //remove the deleted object from your data source.
        //If your data source is an NSMutableArray, do this

        [_allContaktsTable reloadData]; // tell table to refresh now
    }
}
@end
