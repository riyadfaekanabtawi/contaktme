//
//  ShareContactViewController.h
//  ContaktMe
//
//  Created by Riyad Anabtawi on 1/23/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ShareContactDelegate <NSObject>

-(void)ShowDrag;

@end
@interface ShareContactViewController : UIViewController
@property (nonatomic,retain) id<ShareContactDelegate> delegate;
@end
