//
//  Login.h
//  ContaktMe
//
//  Created by Riyad Faek Anabtawi on 11-04-14.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TIME_STEP 5.0f
@protocol LoginDelegate;

@interface Login : UIViewController<UIAlertViewDelegate,UITextFieldDelegate>

@property (nonatomic, weak) id<LoginDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextView *textoIntroduccion;
@property (weak, nonatomic) IBOutlet UILabel *tituloLogin;
@property (weak, nonatomic) IBOutlet UILabel *bien;
@property (weak, nonatomic) IBOutlet UILabel *mensaje;
@property (weak, nonatomic) IBOutlet UILabel *bienvenido;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topRegister;
@property (weak, nonatomic) IBOutlet UIImageView *slideImage;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLogo;
@property (weak, nonatomic) IBOutlet UIButton *registerbutton;
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UIView *registerView;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *fullName;
@property (weak, nonatomic) IBOutlet UITextField *emailRegsiter;
@property (weak, nonatomic) IBOutlet UITextField *passwordRegister;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassword;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLogin;
@property (weak, nonatomic) IBOutlet UIButton * registerMe;
@end

@protocol LoginDelegate <NSObject>
- (void)conexionEstablecida;
@end