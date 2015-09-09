//
//  LoadingAnimationView.m
//  example
//
//  Created by Sam Selvanathan on 11/2/14.
//
//

#import "LoadingAnimationView.h"
#import <QuartzCore/QuartzCore.h>
#import "Functions.h"
static NSString *const animationKey = @"loading.animation.key";
static float const kEaseInEaseOutDuration = 0.5f;

@interface LoadingAnimationView ()


@end

@implementation LoadingAnimationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)endAnimationAndRemoveView{}

+(LoadingAnimationView *)createWithMessage:(NSString *)message andColor:(NSString *)color andImage:(UIImage *)image
{
    
    LoadingAnimationView *loader =nil;

    loader =[[[NSBundle mainBundle] loadNibNamed:@"LoadingAnimationView" owner:self options:nil] objectAtIndex: 0];

    loader.animationView.layer.cornerRadius = loader.animationView.frame.size.width/2;
    loader.animationView.layer.masksToBounds = YES;
 
    loader.imageView.image = image;
   
    loader.animationView.backgroundColor = [Functions colorWithHexString:color];
 

//    [loader.animationView setAlpha:0.0f];
//    [UIView animateWithDuration:kEaseInEaseOutDuration delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
//    [loader.animationView setAlpha:1.0f];
//    } completion:nil];
    
    
    return loader;
}

- (void)hide
{
    [UIView animateWithDuration:kEaseInEaseOutDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [_animationView setAlpha:0.0f];
    } completion:^(BOOL finished) {
        [_animationView.layer removeAnimationForKey:animationKey];
        [self removeFromSuperview];
    }];
}

- (void)startAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    NSArray *time = @[@0.0,
                       @0.25,
                       @0.45,
                       @0.90,
                       @1.0];
    
    NSArray *angle = @[@0,
                        @(-M_PI * 30.0/180.0),
                        @(-M_PI * 30.0/180.0),
                        @(M_PI * 2.0),
                        @(M_PI * 2.0)];
    
    NSArray *function = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];

    
    [animation setKeyTimes:time];
    [animation setValues:angle];
    [animation setTimingFunctions:function];
    animation.duration = 1.2;
    animation.repeatCount = HUGE_VALF;
    [_animationView.layer addAnimation:animation forKey:animationKey];
}

@end
