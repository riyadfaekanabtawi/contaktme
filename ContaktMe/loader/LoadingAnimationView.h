//
//  LoadingAnimationView.h
//  example
//
//  Created by Sam Selvanathan on 11/2/14.
//
//

#import <UIKit/UIKit.h>

@interface LoadingAnimationView : UIView

- (void)showWithImage:(UIImage *)image andColor:(NSString *)color andMessage:(NSString *)message inView:(UIView *)view;
- (void)hide;
- (void)startAnimation;

@end
