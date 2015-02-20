//
//  NavViewController.m
//  ContaktMe
//
//  Created by Riyad Anabtawi on 2/19/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import "NavViewController.h"

@interface NavViewController ()

@end

@implementation NavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

-(BOOL)shouldAutorotate {
    return NO;
}

-(NSUInteger)supportedInterfaceOrientations {
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        return UIInterfaceOrientationMaskLandscape;
        
    }else{
        return UIInterfaceOrientationMaskPortrait;
        
    }
}

@end
