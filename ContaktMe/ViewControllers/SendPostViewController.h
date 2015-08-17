//
//  SendPostViewController.h
//  
//
//  Created by Riyad Anabtawi on 8/16/15.
//
//

#import <UIKit/UIKit.h>
@protocol SendPostDelegate <NSObject,UIScrollViewDelegate,UITextFieldDelegate>

@optional
-(void)postDidSend;
-(void)removeSendPostView;
@end


@interface SendPostViewController : UIViewController
@property (nonatomic,retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic,retain) IBOutlet NSLayoutConstraint *bottomView;
@property (nonatomic,retain) IBOutlet UITextField *titlePostTextField;
@property (nonatomic,retain) IBOutlet UILabel *viewcontrollerTitle;
@property (nonatomic,retain) IBOutlet UITextField *locationPostTextField;
@property (nonatomic,retain) IBOutlet UITextField *positionPostTextField;
@property (nonatomic,retain) IBOutlet UITextField *remunerationPostTextField;
@property (nonatomic,retain) IBOutlet UITextField *categoryPostTextField;
@property (nonatomic,retain) IBOutlet UITextField *benefitsPostTextField;
@property (nonatomic,retain) IBOutlet UITextView *descriptionTextView;
@property (nonatomic,retain) IBOutlet NSLayoutConstraint *width;
@property (nonatomic,retain) IBOutlet NSLayoutConstraint *height;
@property (nonatomic,retain) IBOutlet UILabel *username;
@property (nonatomic,retain) IBOutlet UIImageView *userPicture;
@property (nonatomic,retain) id<SendPostDelegate> delegate;
@end
