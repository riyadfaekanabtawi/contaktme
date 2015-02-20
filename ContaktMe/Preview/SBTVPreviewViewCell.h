//
//  PreviewViewCell.h
//  OTTCanales
//
//  Created by Franklin Cruz on 25-04-14.
//  Copyright (c) 2014 SmartboxTV. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <MessageUI/MessageUI.h>
#import "TickleGestureRecognizer.h"
@class SBTVPreviewViewCell;

@protocol SBTVPreviewViewCellDelegate <NSObject>

-(void)previewViewCellTap:(SBTVPreviewViewCell *)cell;

-(void)removeView;

@end


@interface SBTVPreviewViewCell : UIView <UIImagePickerControllerDelegate,MFMailComposeViewControllerDelegate,UIGestureRecognizerDelegate,UITextFieldDelegate> {
    
    IBOutlet UIImageView *ImageView;

    UIImage *image;
}
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *handTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *panelTop;

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer;
- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer;
- (IBAction)handleRotate:(UIRotationGestureRecognizer *)recognizer;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *closeview;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *shareSlideHeight;
@property (weak, nonatomic) IBOutlet UIButton *close;
@property (weak, nonatomic) IBOutlet UIImageView *closeImage;
@property (nonatomic,retain) id<SBTVPreviewViewCellDelegate> delegate;

@property (nonatomic,retain) User *program;

@property (weak, nonatomic) UIViewController *controller;
@property (strong, nonatomic) IBOutlet UIButton *selectPhoto;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ScreenWidth;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIView *selecORcancelImage;
@property (strong, nonatomic) IBOutlet UIButton *selectImage;
@property (strong, nonatomic) NSArray *contacts;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrolltop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *draggableTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightDrag;
@property (nonatomic,retain) IBOutlet UIImageView *userImage;
@property (nonatomic,retain) IBOutlet UIImageView *userImageSharable;
@property (nonatomic,retain) IBOutlet UILabel *usernameSharable;
@property (nonatomic,retain) IBOutlet UILabel *countrySharable;
@property (nonatomic,retain) UIImagePickerController *imagePicker;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mainviewTop;
@property (nonatomic,retain) IBOutlet UIView *navContainer;
@property (nonatomic,retain) IBOutlet UIView *mainView;
@property (nonatomic,retain) IBOutlet UIView *alertIfUserRejected;
@property (nonatomic,retain) IBOutlet UIScrollView *pullScrollView;
@property (nonatomic,retain) IBOutlet UIView *draggableView;
@property (nonatomic,retain) IBOutlet UIView *openMessage;
@property (nonatomic,retain) IBOutlet UIView *Drag;
@property (nonatomic,retain) IBOutlet UIView *sendText;
@property (nonatomic,retain) IBOutlet UILabel *userName;
@property (nonatomic,retain) IBOutlet UIButton *sendSMS;
@property (nonatomic,retain) IBOutlet UIButton *sendFree;
@property (nonatomic,retain) IBOutlet UIButton *ChatButton;
@property  BOOL accepted;
@property (nonatomic,retain) IBOutlet UILabel *DragLabel;
@property (nonatomic,retain) IBOutlet UILabel *profession;
@property (nonatomic,retain) IBOutlet UILabel *email;
@property (nonatomic,retain) IBOutlet UILabel *cellphone;
@property (nonatomic,retain) IBOutlet UILabel *birthPlace;
@property (nonatomic,retain) IBOutlet UILabel *workplace;
@property (nonatomic,retain) IBOutlet UILabel *status_message;
@property (nonatomic,retain) IBOutlet UIView *LoginContainer;
@property (nonatomic,retain) IBOutlet UIView *hyperView;
@property (nonatomic,retain) IBOutlet UIView *professionView;
@property (nonatomic,retain) IBOutlet UIView *emailView;
@property (nonatomic,retain) IBOutlet UIView *cellphoneView;
@property (nonatomic,retain) IBOutlet UIView *dragUP;
@property (nonatomic,retain) IBOutlet UITextField *emailDestiny;
@property (nonatomic,retain) IBOutlet UIView *workplaceView;
@property (nonatomic,retain) IBOutlet UIView *Shareview;
@property (nonatomic,retain) IBOutlet UILabel *followed_by;
@property (nonatomic,retain) IBOutlet UILabel *location;
@property (nonatomic,retain) IBOutlet UIView *blockUIview;
@property (nonatomic,retain) IBOutlet UIView *CameraView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *slideMenuMargin;
@property (nonatomic,retain) IBOutlet UIView *SlideMenuContainer;
@property (nonatomic,retain) IBOutlet UIView *footer;
@property (nonatomic,retain) IBOutlet UIImageView *shareicon;
@property (nonatomic,retain) UISwipeGestureRecognizer *gesture;

- (void)handleTap:(UITapGestureRecognizer *)recognizer;

@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *monkeyPan;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *bananaPan;

@property (nonatomic,retain) IBOutlet UIImageView *arrow1;
@property (nonatomic,retain) IBOutlet UIImageView *arrow2;
@property (nonatomic,retain) IBOutlet UIImageView *arrow3;

@property (nonatomic,retain) IBOutlet UIImageView *hand;
- (void)handleTickle:(TickleGestureRecognizer *)recognizer;





@property BOOL newMedia;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewPicture;
- (IBAction)useCamera:(id)sender;
- (IBAction)useCameraRoll:(id)sender;

@property (nonatomic,retain) IBOutlet UILabel *name;
@property (nonatomic,retain) IBOutlet UILabel *location_user;

-(SBTVPreviewViewCell *)init;

-(SBTVPreviewViewCell *)initWithFrame:(CGRect)frame;




- (IBAction)imageTap:(id)sender;


@end
