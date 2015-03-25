//
//  AHCarouselViewController.h
//  Carousel
//
//  Created by Ahmed Omer on 21/03/2013.
//
//

#import <QuartzCore/QuartzCore.h>
#import "AHCarouselItem.h"
#import <UIKit/UIKit.h>
@protocol AHCarouselViewControllerDelegate <NSObject>
@optional

-(void)userAppliedforJob:(Job *)job;


@end
@interface AHCarouselViewController : UIViewController <UIScrollViewDelegate,AHCarouselItemDelegate>

{
    NSArray                 *_arrCarouselItems;
    
    IBOutlet UILabel        *_lblTitle;
    IBOutlet UIScrollView   *_scrollView;
    IBOutlet UIView         *_vCarousel;
}

@property (nonatomic,retain) id<AHCarouselViewControllerDelegate> delegate;

@end
