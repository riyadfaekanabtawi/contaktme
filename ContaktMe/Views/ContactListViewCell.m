//
//  ContactListViewCell.m
//  BeepGoosh
//
//  Created by Riyad Anabtawi on 1/11/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import "ContactListViewCell.h"
#import "Functions.h"
#import <QuartzCore/QuartzCore.h>
@implementation ContactListViewCell


- (void)setBounds:(CGRect)bounds {
    [super setBounds:bounds];
    self.contentView.frame = bounds;
}
- (void)awakeFromNib {
//      [super awakeFromNib];
//    self.contentView.frame = self.bounds;
//    self.contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}


-(void)displayUser:(User *)user{
    self.CheckorNot.hidden=YES;
     self.user=user;
    _singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(selectedUser:)];
    [self.tapView addGestureRecognizer:_singleFingerTap];
    _state_view.layer.cornerRadius = _state_view.frame.size.width / 2;
    _state_view.clipsToBounds = YES;
    _userName.text= self.user.name;
 
    _user_image.image=[UIImage imageNamed:self.user.avatar];
    CALayer *layer = _mainView.layer;
    layer.shadowOffset = CGSizeMake(1, 1);
    layer.shadowColor = [[UIColor blackColor] CGColor];
    layer.shadowRadius = 2.0f;
    layer.shadowOpacity = 0.25f;
    layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
    _user_image.layer.cornerRadius = _user_image.frame.size.width / 2;
    _user_image.clipsToBounds = YES;
    _userName.font=[UIFont fontWithName:FONT_REGULAR size:12];
    _mainView.layer.cornerRadius = 5;
    _mainView.layer.masksToBounds = YES;
    
    _request_view.layer.cornerRadius = 5;
    _request_view.layer.masksToBounds = YES;
}

-(void)displayLabel:(NSString *)label andImage:(NSString *)image{
    
 self.CheckorNot.hidden=YES;
    _singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(selectedUser:)];
    [self.tapView addGestureRecognizer:_singleFingerTap];
    _state_view.layer.cornerRadius = _state_view.frame.size.width / 2;
    _state_view.clipsToBounds = YES;
    _userName.text= label;
    _userName.textColor=[Functions colorWithHexString:@"252E39"];
    _icon_image.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@",image]];


    _userName.font=[UIFont fontWithName:FONT_REGULAR size:14];
    _mainView.layer.cornerRadius = 5;
    _mainView.layer.masksToBounds = YES;
}


-(void)displayPrivacy:(NSString *)label andImage:(NSString *)image{
    
 self.CheckorNot.hidden=NO;
    self.imageMainWidth.constant=0;
    self.imageSecondWidth.constant=0;
    [self layoutIfNeeded];
    
    _userName.text= label;
    _userName.textColor=[Functions colorWithHexString:@"252E39"];
    _icon_image.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@",image]];
    
    
    _userName.font=[UIFont fontWithName:FONT_REGULAR size:14];
    _mainView.layer.cornerRadius = 5;
    _mainView.layer.masksToBounds = YES;
}

-(void)setSelected:(BOOL)selected{

    self.selectedBackgroundView.backgroundColor=[UIColor clearColor];

}


-(IBAction)selectedUser:(id)sender{

    [self.delegate selectedUser:self.user];
}


-(IBAction)Sad:(id)sender{
    
    self.requestViewWidth.constant=240.0f;
    self.mainViewWidth.constant=230.0f;
    self.happyWidth.constant=25;

    self.happyWidth.constant=0;
    [self layoutIfNeeded];
    [UIView animateWithDuration:1 animations:^{
        
        self.mainView.backgroundColor=[Functions colorWithHexString:@"cd0c1e"];
        
    } completion:^(BOOL finished) {
        
    }];
        [UIView animateWithDuration:2 animations:^{
            self.mainViewWidth.constant=0.0f;
                    self.mainView.backgroundColor=[UIColor clearColor];
            self.requestViewWidth.constant=0.0f;
            [self layoutIfNeeded];
            
        } completion:^(BOOL finished) {
            
        }];


    
   
    [self.delegate Happy:self.user];


}


-(IBAction)happy:(id)sender{
    self.requestViewWidth.constant=240.0f;
    self.mainViewWidth.constant=230.0f;
     self.sadWidth.constant=25;
    self.sadWidth.constant=0;
    [self layoutIfNeeded];

    [UIView animateWithDuration:1 animations:^{
        
        self.mainView.backgroundColor=[Functions colorWithHexString:@"1d9c30"];
        
    } completion:^(BOOL finished) {
        
    }];

    [UIView animateWithDuration:2 animations:^{
        self.mainView.backgroundColor=[UIColor clearColor];
        self.mainViewWidth.constant=0.0f;
        self.requestViewWidth.constant=0.0f;
        [self layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
    }];

    
 

    
    
    [self.delegate Happy:self.user];
[self.delegate Sad:self.user];

}
@end
