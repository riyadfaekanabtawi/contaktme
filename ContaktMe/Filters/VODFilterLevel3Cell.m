//
//  VODFilterLevel3Cell.m
//  EstadioCDF
//
//  Created by SmartboxTV on 18-01-14.
//  Copyright (c) 2014 CDF. All rights reserved.
//

#import "VODFilterLevel3Cell.h"
#import "User.h"
#import "Functions.h"
#import "UIImageView+WebCache.h"

@implementation VODFilterLevel3Cell{




}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib {
    
    self.imageLabel.font = [UIFont fontWithName:FONT_REGULAR size:self.imageLabel.font.pointSize];
    self.titleLabel.font = [UIFont fontWithName:FONT_REGULAR size:self.titleLabel.font.pointSize];
}

-(void)displayData:(User *)filter {

    

    self.titleLabel.text = filter.name;



    self.image.layer.cornerRadius = 3;
    self.image.image=[UIImage imageNamed:filter.avatar];
    
//    if ([filter objectForKey:@"shieldImage"] != nil && ![filter isKindOfClass:[NSNull class]]) {
//        [self.image sd_setImageWithURL:[NSURL URLWithString:[filter objectForKey:@"shieldImage"]] placeholderImage:[UIImage imageNamed:@"placeholder-filtro.jpg"]completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//            if (image != nil) {
//                
//                self.image.image = image;
//                self.image.image=nil;
//                CGAffineTransform scale = CGAffineTransformMakeScale(1.1, 1.1);
//                CGAffineTransform translate = CGAffineTransformMakeTranslation(0,0);
//                self.image.transform =CGAffineTransformConcat(scale,translate);
//                [UIView transitionWithView:self.image
//                                  duration:0.5f
//                                   options:UIViewAnimationOptionTransitionCrossDissolve
//                                animations:^{
//                                    
//                                    self.image.image = image;
//                                    self.image.transform = CGAffineTransformIdentity;
//                                    self.image.image = image;
//                                } completion:nil];
//                
//                
//                self.image.contentMode = UIViewContentModeScaleAspectFill;
//                
//                
//            }
//            else {
//                self.image.image = [UIImage imageNamed:@"placeholder-filtro.jpg"];
//            }
//        }];
//        
//        
//        
//    }
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        self.titleLabel.font = [UIFont fontWithName:FONT_REGULAR size:16];
    }else{

        self.titleLabel.font = [UIFont fontWithName:FONT_REGULAR size:12];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    if ( selected ) {
        self.backgroundColor  = [UIColor whiteColor];

    }
    else {
        self.mainView.backgroundColor  = [UIColor clearColor];
        self.mainView.alpha=1;
    }
    
    // Configure the view for the selected state
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    
    if ( highlighted ) {
        self.mainView.backgroundColor  = [UIColor clearColor];
        self.mainView.alpha=1;
    }
    else {
        self.mainView.backgroundColor  = [UIColor clearColor];
          self.mainView.alpha=1;
    }
    
}



@end
