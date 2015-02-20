//
//  LoaderView.h
//  BeepGoosh
//
//  Created by Riyad Anabtawi on 1/11/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoaderView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

+(LoaderView *)create;


-(void)startAnimation;
-(void)endAnimation;

@end
