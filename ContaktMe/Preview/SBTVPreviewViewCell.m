//
//  PreviewViewCell.m
//  OTTCanales
//
//  Created by Franklin Cruz on 25-04-14.
//  Copyright (c) 2014 SmartboxTV. All rights reserved.
//

#import "SBTVPreviewViewCell.h"
#import "Functions.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImageView+WebCache.h"

@implementation SBTVPreviewViewCell

@synthesize program = _program;

-(void)setProgram:(User *)program {
    _program = program;

    [self displayData];
}



-(SBTVPreviewViewCell *)init{


    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {


        for(id object in [[NSBundle mainBundle]  loadNibNamed:@"PreviewViewCell_iPad" owner:self options:nil]){

            if([object isKindOfClass:[SBTVPreviewViewCell class]]){
                self=object;
                
            }
        }


    }
    else {

        for(id object in [[NSBundle mainBundle]  loadNibNamed:@"PreviewViewCell_iPhone" owner:self options:nil]){

            if([object isKindOfClass:[SBTVPreviewViewCell class]]){
                self=object;

            }
        }



    }
    
    self.topSpaceProjectPanel.constant= [UIScreen mainScreen].bounds.size.height;
    [self layoutIfNeeded];
        
        UITapGestureRecognizer * recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        recognizer.delegate = self;
        [self.hyperView addGestureRecognizer:recognizer];

        
        // TODO: Add a custom gesture recognizer too
        TickleGestureRecognizer * recognizer2 = [[TickleGestureRecognizer alloc] initWithTarget:self action:@selector(handleTickle:)];
        recognizer2.delegate = self;
        [self.hyperView addGestureRecognizer:recognizer2];
        
    self.dragUP.alpha=0.0f;
    self.Shareview.alpha=0.0f;
    self.CameraView.alpha=0.0f;
    self.userName.font=[UIFont fontWithName:FONT_LIGHT size:16];
     self.location_user.font=[UIFont fontWithName:FONT_LIGHT size:16];
    self.name.font=[UIFont fontWithName:FONT_LIGHT size:16];
    self.location.font=[UIFont fontWithName:FONT_LIGHT size:16];
    self.location.font=[UIFont fontWithName:FONT_BOLD size:14];
    self.email.font=[UIFont fontWithName:FONT_BOLD size:14];
    self.profession.font=[UIFont fontWithName:FONT_BOLD size:14];
    self.followed_by.font=[UIFont fontWithName:FONT_LIGHT size:14];
    self.cellphone.font=[UIFont fontWithName:FONT_BOLD size:14];
    self.createProject.font=[UIFont fontWithName:FONT_LIGHT size:self.createProject.font.pointSize];
     self.nearbyOffers.font=[UIFont fontWithName:FONT_LIGHT size:self.nearbyOffers.font.pointSize];
     self.nearbyProfessionals.font=[UIFont fontWithName:FONT_LIGHT size:self.nearbyProfessionals.font.pointSize];
     self.myMessages.font=[UIFont fontWithName:FONT_LIGHT size:self.myMessages.font.pointSize];
     self.SHARE.font=[UIFont fontWithName:FONT_BOLD size:self.SHARE.font.pointSize];
     self.ME.font=[UIFont fontWithName:FONT_LIGHT size:self.ME.font.pointSize];
    self.TapTo.font=[UIFont fontWithName:FONT_BOLD size:self.TapTo.font.pointSize];
    self.shareTap.font=[UIFont fontWithName:FONT_LIGHT size:self.shareTap.font.pointSize];
     self.TitlesecctionProject.font=[UIFont fontWithName:FONT_BOLD size:self.TitlesecctionProject.font.pointSize];
         self.postProject.titleLabel.font=[UIFont fontWithName:FONT_LIGHT size:self.postProject.titleLabel.font.pointSize];
    
    self.projecttitle.font=[UIFont fontWithName:FONT_LIGHT size:self.projecttitle.font.pointSize];
    UIColor *color = [UIColor whiteColor];
    self.projecttitle.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Project Title" attributes:@{NSForegroundColorAttributeName: color}];
        self.projectDetails.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Project Details" attributes:@{NSForegroundColorAttributeName: color}];
        self.professionalRequired.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Professional Required" attributes:@{NSForegroundColorAttributeName: color}];
    
        self.AvaragePay.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Avarage Pay" attributes:@{NSForegroundColorAttributeName: color}];
    self.projectDetails.font=[UIFont fontWithName:FONT_LIGHT size:self.projectDetails.font.pointSize];
    self.professionalRequired.font=[UIFont fontWithName:FONT_LIGHT size:self.professionalRequired.font.pointSize];
    self.status_message.font=[UIFont fontWithName:FONT_LIGHT size:14];
    self.AvaragePay.font=[UIFont fontWithName:FONT_LIGHT size:self.AvaragePay.font.pointSize];
    self.birthPlace.font=[UIFont fontWithName:FONT_LIGHT size:14];
    self.workplace.font=[UIFont fontWithName:FONT_BOLD size:14];
    self.location.textColor=[Functions colorWithHexString:@"f35e46"];
    self.name.textColor=[Functions colorWithHexString:@"f35e46"];
          self.sendText.alpha=0.0f;
    return self;


}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer {
    

    CGPoint translation = [recognizer translationInView:self.dragUP];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + 0,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.dragUP];
    
    

    if (recognizer.state == UIGestureRecognizerStateEnded) {
        
        CGPoint velocity = [recognizer velocityInView:self.hyperView];
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        CGFloat slideMult = magnitude / 200;
    
        
        float slideFactor = 0.1 * slideMult; // Increase for more of a slide
        CGPoint finalPoint = CGPointMake(recognizer.view.center.x + 0,
                                         recognizer.view.center.y + (velocity.y * slideFactor));
        finalPoint.x = MIN(MAX(finalPoint.x, 0), self.hyperView.bounds.size.width);
        
        if(IS_IPHONE_4){
        
         finalPoint.y =220;
        }else if(IS_IPHONE_5){
        finalPoint.y =260;
        
        }else if(IS_IPHONE_6){
        
         finalPoint.y =320;
        }else if(IS_IPHONE_6Plus){
         finalPoint.y =350;
        
        
        }
       
        
        [UIView animateWithDuration:slideFactor*0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            recognizer.view.center = finalPoint;
          
        } completion:^(BOOL finished) {
            
            //Call sharing Service
            self.dragUP.alpha=.9f;
            
            self.footer.alpha=0.0f;
            [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.dragUP.alpha=0.0f;
                
                self.footer.alpha=1.0f;
            } completion:nil];
            
        }];
  
    }
    
}

- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer {
    
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
    recognizer.scale = 1;
    
}

- (IBAction)handleRotate:(UIRotationGestureRecognizer *)recognizer {
    
    recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation);
    recognizer.rotation = 0;
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer {

}

- (void)handleTickle:(TickleGestureRecognizer *)recognizer {

}


-(SBTVPreviewViewCell *)initWithFrame:(CGRect)frame{

    self = [self init];

    if (self) {
        self.frame = frame;
    }

    return self;



}


-(void)displayData {

 
  //  CGRect screenRect = [[UIScreen mainScreen] bounds];
   
    if(IS_IPHONE_6Plus){
        self.ScreenWidth.constant=410;
        self.topImage.constant=170;
        
        self.scrollHeight.constant=700;
        [self layoutIfNeeded];
        
        
    }else if(IS_IPHONE_6){
      
        self.ScreenWidth.constant=370;
        self.topImage.constant=170;
        
        self.scrollHeight.constant=700;
        [self layoutIfNeeded];
       
    }else if(IS_IPHONE_5){
        self.ScreenWidth.constant=320;
        self.topImage.constant=240;
                self.closeview.constant=310;
        self.scrollHeight.constant=680;
        [self layoutIfNeeded];
    }
    else if(IS_IPHONE_4){
         self.ScreenWidth.constant=320;
        self.topImage.constant=240;
        self.closeview.constant=310;
        self.scrollHeight.constant=680;
        [self layoutIfNeeded];
    }
    
 
    self.userImage.layer.cornerRadius = self.userImage.frame.size.width / 2;
    self.userImage.clipsToBounds = YES;
    self.userImage.layer.borderWidth = 5.0f;
    self.userImage.layer.borderColor = [Functions colorWithHexString:@"f35e46"].CGColor;
   
    CALayer *btnLayer = [self.sendSMS layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:5.0f];
    self.sendSMS.layer.borderColor=(__bridge CGColorRef)([Functions colorWithHexString:@"ffffff"]);
    self.professionView.layer.cornerRadius = 2;
    self.professionView.layer.masksToBounds = YES;
    
    
    self.emailView.layer.cornerRadius = 2;
    self.emailView.layer.masksToBounds = YES;
    
    self.cellphoneView.layer.cornerRadius = 2;
    self.cellphoneView.layer.masksToBounds = YES;
    
    self.workplaceView.layer.cornerRadius = 2;
    self.workplaceView.layer.masksToBounds = YES;
    
    
//    CALayer *layer= self.mainView.layer;
//    layer.shadowOffset = CGSizeMake(1, 1);
//    layer.shadowColor = [[UIColor blackColor] CGColor];
//    layer.shadowRadius = 2.0f;
//    layer.shadowOpacity = 0.25f;
//    layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
    
    self.Drag.alpha=0.0f;
    self.imageView.alpha=0.0f;
    self.selectImage.alpha=0.0f;
    

    self.userImage.image=[UIImage imageNamed:_program.avatar];
       self.userImageSharable.image=[UIImage imageNamed:_program.avatar];
    self.userName.text=_program.name;
    self.usernameSharable.text=_program.name;
    self.countrySharable.text=[NSString stringWithFormat:@"%@, %@",_program.city,_program.country];
    self.location_user.text=[NSString stringWithFormat:@"%@, %@",_program.city,_program.country];
    self.profession.text=_program.profession;
    self.cellphone.text=_program.mobilephone;
    self.workplace.text=_program.workplace;
    self.email.text=_program.email;
    self.birthPlace.text=[NSString stringWithFormat:@"From %@",_program.birthPlace];
    self.status_message.text=_program.status_message;
    self.followed_by.text=[NSString stringWithFormat:@"Followed by %@ people",_program.followed_by];



}

-(IBAction)imageTap:(id)sender{

    [self.delegate removeView];

}


-(IBAction)sendText:(id)sender{
      self.sendText.alpha=0.0f;

    [UIView animateWithDuration:0.5 animations:^{
        
        self.sendText.alpha=1.f;
        
        
    } completion:^(BOOL finished) {
        
    }];

}

-(IBAction)sendEmail:(id)sender{

    NSString *emailTitle = [NSString stringWithFormat:@"Hi %@!",self.program.name];
    // Email Content
    NSString *messageBody = @" ";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:self.program.email];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self.controller presentViewController:mc animated:YES completion:NULL];

}




-(IBAction)callUser:(id)sender{
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",_program.mobilephone]]];
}

-(IBAction)Chat:(id)sender{


}


-(IBAction)sendSMS:(id)sender{




}
-(IBAction)hideTEXTView:(id)sender{
 self.sendText.alpha=1.f;
    [UIView animateWithDuration:0.5 animations:^{
        
        self.sendText.alpha=.0f;
        
        
    } completion:^(BOOL finished) {
        
    }];
}






- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    
    
    
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    
    // Close the Mail Interface
    [self.controller dismissViewControllerAnimated:YES completion:NULL];
}


-(IBAction)tapShare:(id)sender{

    self.Shareview.alpha=0.0f;
    [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.Shareview.alpha=1.0f;
        
        
    } completion:nil];
}


-(IBAction)tapDismissShare:(id)sender{

    self.dragUP.alpha=.9f;

    self.footer.alpha=0.0f;
    [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.dragUP.alpha=0.0f;

        self.footer.alpha=1.0f;
    } completion:nil];

}


-(IBAction)Done:(id)sender{
   
    
    [self.emailDestiny resignFirstResponder];
    self.Shareview.alpha=1.0f;
    [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.Shareview.alpha=0.0f;
        self.dragUP.alpha=.9f;
        self.footer.alpha=0.0f;
        
    } completion:nil];
    


    
}



-(IBAction)dismissEmailSender:(id)sender{
    
    
    [self.emailDestiny resignFirstResponder];
    self.Shareview.alpha=1.0f;
    [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.Shareview.alpha=0.0f;
        self.dragUP.alpha=0.0f;
        self.footer.alpha=1.0f;
        
    } completion:nil];
    
    
    
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    
    [textField resignFirstResponder];
    self.Shareview.alpha=1.0f;
    [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.Shareview.alpha=0.0f;
        self.dragUP.alpha=.9f;
        self.footer.alpha=0.0f;
        
    } completion:nil];
    
    
    return YES;
}


-(IBAction)ShowCamOptions:(id)sender{

    [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        self.CameraView.alpha=1.0f;
    } completion:nil];

}

-(IBAction)hideCamview:(id)sender{

    _imageViewPicture=nil;

    [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.CameraView.alpha=0.0f;
    } completion:nil];
    

}
- (IBAction)useCamera:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
      //  imagePicker.delegate = self;
        
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypeCamera;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = NO;
        [self.controller presentViewController:imagePicker
                           animated:YES completion:nil];
        _newMedia = YES;
    }
}

- (IBAction)useCameraRoll:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeSavedPhotosAlbum])
    {
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
      //  imagePicker.delegate = self;
        
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = NO;
        [self.controller presentViewController:imagePicker
                           animated:YES completion:nil];
        _newMedia = NO;
    }
}


#pragma mark -
#pragma mark UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    
    [self.controller dismissViewControllerAnimated:YES completion:nil];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *imagePicked = info[UIImagePickerControllerOriginalImage];
        
        _imageViewPicture.image = imagePicked;
        if (_newMedia)
            UIImageWriteToSavedPhotosAlbum(imagePicked,
                                           self,
                                           @selector(imagePicked:finishedSavingWithError:contextInfo:),
                                           nil);
    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
    {
        // Code here to support video if enabled
    }
}

-(void)imagePicked:(UIImage *)image
finishedSavingWithError:(NSError *)error
 contextInfo:(void *)contextInfo
{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Save failed"
                              message: @"Failed to save image"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
}


-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [self.controller dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)showPanel:(id)sender{

    [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        self.panelTop.constant=393;
        [self layoutIfNeeded];
    } completion:nil];


}


-(IBAction)CreateProject:(id)sender{

    [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        self.topSpaceProjectPanel.constant=0;
        [self layoutIfNeeded];
    } completion:nil];



}
-(IBAction)hideCreateProject:(id)sender{
    [self.projecttitle resignFirstResponder];
    [self.projectDetails resignFirstResponder];
    [self.professionalRequired resignFirstResponder];
    [self.AvaragePay resignFirstResponder];
    [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        self.topSpaceProjectPanel.constant=[UIScreen mainScreen].bounds.size.height;
        [self layoutIfNeeded];
    } completion:nil];
    
    
    
}
-(IBAction)NearbyOffers:(id)sender{
    
    [self.delegate nearbyOffers];
    
    
}

-(IBAction)PostProject:(id)sender{
    
    [self.projecttitle resignFirstResponder];
    [self.projectDetails resignFirstResponder];
    [self.professionalRequired resignFirstResponder];
    [self.AvaragePay resignFirstResponder];
    [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        self.topSpaceProjectPanel.constant=[UIScreen mainScreen].bounds.size.height;
        [self layoutIfNeeded];
    } completion:nil];
    
    
    
}


-(IBAction)NearbyProfessionals:(id)sender{
    
    
    [self.delegate nearbyProfessionals];
    
}

-(IBAction)MyMessages:(id)sender{
    
    
    
    
}


@end
