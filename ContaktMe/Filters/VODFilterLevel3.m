//
//  VODFilterLevel3.m
//  EstadioCDF
//
//  Created by SmartboxTV on 18-01-14.
//  Copyright (c) 2014 CDF. All rights reserved.
//

#import "VODFilterLevel3.h"
#import "VODFilterLevel3Cell.h"
#import "Functions.h"
@implementation VODFilterLevel3

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }

    return self;

}


+(VODFilterLevel3 *)createWithFilter:(NSArray *)filter andType:(NSString *)type {


    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        VODFilterLevel3 *view = [[[NSBundle mainBundle] loadNibNamed:@"VODFilterLevel3" owner:self options:nil] objectAtIndex: 0];

        view.filter = filter;

  view.filter = filter;

        view.tableView.contentInset = UIEdgeInsetsMake(0, 0, 10, 0);
        
        [view.tableView registerNib:[UINib nibWithNibName:@"VODFilterLevel3Cell"
                                                   bundle:[NSBundle mainBundle]]
             forCellReuseIdentifier:@"VODFilterLevel3Cell"];


        [view.tableView reloadData];
        view.type=type;
        return view;
    }else{
        VODFilterLevel3 *view = [[[NSBundle mainBundle] loadNibNamed:@"VODFilterLevel3_iPhone" owner:self options:nil] objectAtIndex: 0];

        view.filter = filter;
   view.type=type;
   
        [view.tableView registerNib:[UINib nibWithNibName:@"VODFilterLevel3Cell_iPhone"
                                                   bundle:[NSBundle mainBundle]]
             forCellReuseIdentifier:@"VODFilterLevel3Cell"];


        [view.tableView reloadData];
        view.backgroundColor=[UIColor whiteColor];
        return view;


    }
}


#pragma mark - UITableView

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if([_type isEqualToString:@"search"]){
      if([[self.filter objectAtIndex:indexPath.row] isEqualToString:@"For Jobs"]){
          [self.delegate displaySearchJobs];
      }else  if([[self.filter objectAtIndex:indexPath.row] isEqualToString:@"For Professionals"]){
       [self.delegate displaySearchProf];
          
      }
    
    }else if([_type isEqualToString:@"projects"]){
     
        [self.delegate userSelectedJob];
    }else{
        User *item = [self.filter objectAtIndex:indexPath.row];
        if([item.accepted isEqualToString:@"NO"]){
        
            [self.delegate displayAlertToAcceptUser:item];
        
        }else{
        [self.delegate displayUser:item];
        
        }
        
    }


}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return 118;
    }else{

        return 115;


    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return [self.filter count];
  
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell setBackgroundColor:[UIColor clearColor]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"VODFilterLevel3Cell";

    VODFilterLevel3Cell *cell = [self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[VODFilterLevel3Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if([_type isEqualToString:@"search"]){
    
        cell.titleLabel.text=[self.filter objectAtIndex:indexPath.row];
        if([[self.filter objectAtIndex:indexPath.row] isEqualToString:@"For Jobs"]){
            cell.image.image=[UIImage imageNamed:@"jobs_icon.png"];
        
        }else  if([[self.filter objectAtIndex:indexPath.row] isEqualToString:@"For Professionals"]){
             cell.image.image=[UIImage imageNamed:@"pros_icon.png"];
        
        }
    
    }else  if([_type isEqualToString:@"projects"]){
        
        cell.titleLabel.text=[NSString stringWithFormat:@"%@",[self.filter objectAtIndex:indexPath.row]];
  
        
    }else{
    
        self.user=[self.filter objectAtIndex:indexPath.row];
        if([self.user.accepted isEqualToString:@"YES"]){
            cell.image.alpha=1;
          
        
        }else{
            cell.image.alpha=.3;
 
        
        }
        [cell displayData:self.user];
        cell.delegate =self;
    }

   
  
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    VODFilterLevel3Cell *cell = (VODFilterLevel3Cell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
}

-(void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    VODFilterLevel3Cell *cell = (VODFilterLevel3Cell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    

    return 0;
    
}

@end
