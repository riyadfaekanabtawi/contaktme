//
//  NearbyJobsViewController.m
//  contaktme
//
//  Created by Riyad Anabtawi on 3/1/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import "NearbyJobsViewController.h"
#import "GGView.h"
#import "Functions.h"
#import "AHCarouselItem.h"
#import "AHCarouselViewController.h"
@interface NearbyJobsViewController ()

@end

@implementation NearbyJobsViewController
- (NSArray*)carouselItems
{
    return [NSArray arrayWithObjects:
            
            [AHCarouselItem itemWithTitle:@"Basketball"
                                    image:[UIImage imageNamed:@"btn-basketball.png"]
                                   target:nil
                                   action:nil],
            
            [AHCarouselItem itemWithTitle:@"Black Cat"
                                    image:[UIImage imageNamed:@"btn-black-cat.png"]
                                   target:nil
                                   action:nil],
            
            [AHCarouselItem itemWithTitle:@"Bluetooth"
                                    image:[UIImage imageNamed:@"btn-bluetooth.png"]
                                   target:nil
                                   action:nil],
            
            [AHCarouselItem itemWithTitle:@"Compass"
                                    image:[UIImage imageNamed:@"btn-compass.png"]
                                   target:nil
                                   action:nil],
            
            [AHCarouselItem itemWithTitle:@"Flag"
                                    image:[UIImage imageNamed:@"btn-flag.png"]
                                   target:nil
                                   action:nil],
            
            [AHCarouselItem itemWithTitle:@"Glasses"
                                    image:[UIImage imageNamed:@"btn-glasses.png"]
                                   target:nil
                                   action:nil],
            
            [AHCarouselItem itemWithTitle:@"Seat"
                                    image:[UIImage imageNamed:@"btn-seat.png"]
                                   target:nil
                                   action:nil],
            
            [AHCarouselItem itemWithTitle:@"Truck"
                                    image:[UIImage imageNamed:@"btn-truck.png"]
                                   target:nil
                                   action:nil],
            
            nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    

  
    //self.view = [[GGView alloc] init];
   
    
    

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

@end
