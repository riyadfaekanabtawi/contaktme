//
//  AHCarouselItem.m
//  Carousel
//
//  Created by Ahmed Omer on 21/03/2013.
//
//

#import "AHCarouselItem.h"
#import "Functions.h"
@implementation AHCarouselItem



+ (AHCarouselItem*)itemWithTitle:(NSString *)title
                           image:(UIImage*)image
                          target:(id)target
                          action:(SEL)action
{
    AHCarouselItem *item = [[[NSBundle mainBundle] loadNibNamed:@"AHItemView" owner:self options:nil] objectAtIndex:0];
    

    item.frame =        CGRectMake((SIZE * 0), SIZE/2, SIZE, SIZE);
    item.center =       CGPointMake(((SIZE * 0) + (SIZE/2)), (SIZE/2));

    item.view.layer.borderColor =    [[UIColor grayColor] CGColor];
    item.view.layer.borderWidth =    .5;
    item.view.layer.shadowColor=[[UIColor lightGrayColor] CGColor];
    item.view.layer.shadowColor =    [[UIColor blackColor] CGColor];
    item.view.layer.shadowOffset =   CGSizeMake(1.0, 1.0);
    item.view.layer.shadowOpacity =  0.8;
    item.timeLabel.font=[UIFont fontWithName:FONT_LIGHT size:item.timeLabel.font.pointSize];
    item.descriptionLabel.font=[UIFont fontWithName:FONT_LIGHT size:item.descriptionLabel.font.pointSize];
    item.jobTitle.font=[UIFont fontWithName:FONT_LIGHT size:item.jobTitle.font.pointSize];
     item.applyJob.titleLabel.font=[UIFont fontWithName:FONT_BOLD size:item.applyJob.titleLabel.font.pointSize];
    item.timeLabel.text=@"13 Feb | 23:00 Hrs";
    item.descriptionLabel.text=@"Here goes the job details or description";
    item.jobTitle.text=title;
    item.jobImage.image=image;
    return item;
}
-(IBAction)apllforJob:(id)sender{

    [self.delegate userAppliedforJob:self.job];

}
@end
