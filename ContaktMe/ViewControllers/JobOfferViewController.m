//
//  JobOfferViewController.m
//  contaktme
//
//  Created by Riyad Anabtawi on 3/2/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import "JobOfferViewController.h"
#import "Functions.h"
@interface JobOfferViewController ()

@end

@implementation JobOfferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    
    logo.clipsToBounds = YES;
    logo.contentMode = UIViewContentModeScaleAspectFit;
    
    logo.frame=CGRectMake(logo.frame.origin.x, logo.frame.origin.y, 140, 20);
    UIView *logoContainer = [[UIView alloc] initWithFrame:logo.frame];
    [logoContainer addSubview:logo];
    [self slideMenuSetup];
    self.navigationItem.titleView = logoContainer;
    self.navigationItem.leftBarButtonItem.title = @"";
    self.navigationController.navigationBar.topItem.title = @"";
    
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
- (void)slideMenuSetup
{
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.navigationController.navigationBar removeGestureRecognizer:self.revealViewController.panGestureRecognizer];
        
        [self.navigationController.navigationBar setTintColor:[Functions colorWithHexString:@"F35e46"]];
    }
}


@end
