//
//  NavigationView.m
//  BeepGoosh
//
//  Created by Riyad Anabtawi on 1/11/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import "NavigationView.h"
#import "Functions.h"
@implementation NavigationView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+(NavigationView *)create {
    
   
        
        NavigationView *view = [[[NSBundle mainBundle] loadNibNamed:@"NavigationView" owner:self options:nil] objectAtIndex: 0];
        
    view.backgroundColor=[Functions colorWithHexString:@"2d3e4f"];
    
    CALayer *layer = view.layer;
    layer.shadowOffset = CGSizeMake(1, 1);
    layer.shadowColor = [[UIColor blackColor] CGColor];
    layer.shadowRadius = 2.0f;
    layer.shadowOpacity = 0.25f;
    layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
        return view;
        

}


-(IBAction)openSlide:(id)sender{


    [self.delegate showSlideMenu];

}

-(IBAction)openSettings:(id)sender{

    [self.delegate showSettings];
}

-(IBAction)hideSlide:(id)sender{




}


-(IBAction)goBack:(id)sender{
 
    [self.delegate goback];

}


-(void)hideback{

    self.backButton.hidden=YES;
    self.backicon.hidden=YES;

}

-(void)hidemenu{
    self.menuButton.hidden=YES;
    self.menuicon.hidden=YES;

}

-(void)hidesettings{

    self.settingicon.hidden=YES;
    self.settingsButton.hidden=YES;
}
@end
