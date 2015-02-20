//
//  SearchUserViewController.m
//  ContaktMe
//
//  Created by Riyad Anabtawi on 2/12/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import "SearchUserViewController.h"

@interface SearchUserViewController ()

@end

@implementation SearchUserViewController


-(void)selectedUser:(User *)user{}
-(void)Happy:(User *)user{}
-(void)Sad:(User *)user{}

- (void)viewDidLoad {
    [super viewDidLoad];
    
        [self.searchTableView registerNib:[UINib nibWithNibName:@"ContactListViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"contactcell"];
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_titulos count];
    
}
-(void)textFieldDidChange{
    [_timer invalidate];
    _timer =nil;
    
    if(_textField.text.length == 0){
        
        _titulos=nil;
        
        [_searchTableView reloadData];
        
        
    }else{
        
        
        _timer = [NSTimer scheduledTimerWithTimeInterval: 1.0
                                                  target: self
                                                selector:@selector(timerHit)
                                                userInfo: nil repeats:NO];
        
        
        
    }
    
    
}


-(void)timerHit{
    
    
//    [self.delegate searchMethodQuery:_textField.text andhandler:^(id search) {
//        
//        
//        if([search count]<=0){
//            
//            
//            _nohay.hidden=NO;
//            
//        }else{
//            
//            
//            
//            _nohay.hidden=YES;
//            _titulos=search;
//            
//            [_searchTableView reloadData];
//            
//        }
//        
//        
//    } orErrorHandler:^(NSError *error){
//        _nohay.hidden=NO;
//        
//        
//    }];
    
    
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
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ContactListViewCell *cell = [_searchTableView dequeueReusableCellWithIdentifier:@"SearchCell"];
    
    if (cell == nil) {
        cell = [[ContactListViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"contactcell"];
        
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    

    
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.user=[User new];
    self.user =[_titulos objectAtIndex:indexPath.row];
    if(indexPath.section==0){
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Whant to Block?"
                                                          message:nil
                                                         delegate:nil
                                                cancelButtonTitle:@"YES"
                                                otherButtonTitles:nil];
        
        ;
        
        [message show];
        
    }else{
        
        
    }
    [self hideKeyboard];

    
}

-(void)hideKeyboard{
    
    [_textField resignFirstResponder];

    
}

-(void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex==0) {
        //Block user
        
        
    } else {
     
        
        
    }
}

-(IBAction)dismiss:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
