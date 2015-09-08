//
//  SendPostViewController.m
//  
//
//  Created by Riyad Anabtawi on 8/16/15.
//
//
#import "UIImageView+WebCache.h"
#import "SendPostViewController.h"
#import "Services.h"
@interface SendPostViewController ()

@end

@implementation SendPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.userPicture.layer.cornerRadius = self.userPicture.frame.size.width/2;
    self.userPicture.layer.masksToBounds = YES;
    self.username.font = [UIFont fontWithName:FONT_REGULAR size:self.username.font.pointSize];
    [self.userPicture sd_setImageWithURL:[NSURL URLWithString:[defaults objectForKey:@"user_image"]]];
    self.username.text = [defaults objectForKey:@"user_name"];
    self.titlePostTextField.font = [UIFont fontWithName:FONT_REGULAR size:self.titlePostTextField.font.pointSize];
    self.viewcontrollerTitle.font = [UIFont fontWithName:FONT_REGULAR size:self.viewcontrollerTitle.font.pointSize];
    self.descriptionTextView.font = [UIFont fontWithName:FONT_REGULAR size:self.descriptionTextView.font.pointSize];
    self.positionPostTextField.font = [UIFont fontWithName:FONT_REGULAR size:self.positionPostTextField.font.pointSize];
     self.locationPostTextField.font = [UIFont fontWithName:FONT_REGULAR size:self.positionPostTextField.font.pointSize];
    self.remunerationPostTextField.font = [UIFont fontWithName:FONT_REGULAR size:self.locationPostTextField.font.pointSize];
    self.categoryPostTextField.font = [UIFont fontWithName:FONT_REGULAR size:self.categoryPostTextField.font.pointSize];
    self.benefitsPostTextField.font = [UIFont fontWithName:FONT_REGULAR size:self.benefitsPostTextField.font.pointSize];
    
    self.width.constant = self.view.frame.size.width;
    self.height.constant = self.view.frame.size.height;
    
    [self.view layoutIfNeeded];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    

    
    
}



- (void)viewWillAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - keyboard movements
- (void)keyboardWillShow:(NSNotification *)notification
{
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    [UIView animateWithDuration:0.3 animations:^{
      
    self.bottomView.constant = keyboardSize.height;
        [self.view layoutIfNeeded];
    }];
}

-(void)keyboardWillHide:(NSNotification *)notification
{
    [UIView animateWithDuration:0.3 animations:^{
        self.bottomView.constant = 0;
        [self.view layoutIfNeeded];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)sendPost:(id)sender{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([self.titlePostTextField.text isEqualToString:@""] || [self.descriptionTextView.text isEqualToString:@""] || [self.remunerationPostTextField.text isEqualToString:@""] || [self.categoryPostTextField.text isEqualToString:@""] || [self.locationPostTextField.text isEqualToString:@""] || [self.positionPostTextField.text isEqualToString:@""] || [self.benefitsPostTextField.text isEqualToString:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ooops..."
                                                        message:@"You have to fill in all the fields. Please try again."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];

    
    }else{
        [Services PostforUser:[defaults objectForKey:@"user_id"] andTitle:self.titlePostTextField.text andDescr:self.descriptionTextView.text andRemuneration:self.remunerationPostTextField.text andCategory:self.categoryPostTextField.text andLocation:self.locationPostTextField.text andPosition:self.positionPostTextField.text andBenefits:self.benefitsPostTextField.text WithHandler:^(id response) {
            
            
            [self.delegate postDidSend];
            BOOL firstTime;
            
            
            
            if (!firstTime){
                firstTime = YES;
                [self.navigationController popViewControllerAnimated:YES];
            }
            
        } orErrorHandler:^(NSError *err) {
            
            
            
        }];
        
    
    
    }
    
    
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(IBAction)RemovePostSendView:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}






-(BOOL)textFieldShouldReturn:(UITextField*)textField
{
    NSInteger nextTag = textField.tag + 1;
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
    } else {
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
    }
    return NO; // We do not want UITextField to insert line-breaks.
}




@end
