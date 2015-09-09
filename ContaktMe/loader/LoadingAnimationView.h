//
//  LoadingAnimationView.h
//  example
//
//  Created by Sam Selvanathan on 11/2/14.
//
//

#import <UIKit/UIKit.h>

@interface LoadingAnimationView : UIView



@property (nonatomic, weak) IBOutlet UIView *animationView;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;


- (void)hide;
- (void)startAnimation;
+(LoadingAnimationView *)createWithMessage:(NSString *)message andColor:(NSString *)color andImage:(UIImage *)image
;
@end
