//
//  AHCarouselItem.h
//  Carousel
//
//  Created by Ahmed Omer on 21/03/2013.
//
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "Job.h"

#define SIZE 300.0
@protocol AHCarouselItemDelegate <NSObject>
@optional

-(void)userAppliedforJob:(Job *)job;


@end



@interface AHCarouselItem : UIView
{
    NSString *_strItemTitle;
}
@property Job *job;
@property (nonatomic, retain) IBOutlet UILabel *jobTitle;
@property (nonatomic, retain) IBOutlet UILabel *timeLabel;
@property (nonatomic, retain) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, retain) IBOutlet UIImageView *jobImage;
@property (nonatomic, retain) IBOutlet UIView *view;
@property (nonatomic,retain) id<AHCarouselItemDelegate> delegate;
@property (nonatomic, retain) IBOutlet UIButton *applyJob;
+ (AHCarouselItem*)itemWithTitle:(NSString *)title
                           image:(UIImage*)image
                          target:(id)target
                          action:(SEL)action;
-(IBAction)apllforJob:(id)sender;
@end
