//
//  Login.h
//  ContaktMe
//
//  Created by Riyad Faek Anabtawi on 11-04-14.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TIME_STEP 5.0f


@interface UpdateBasicInfoViewController : UIViewController<UIAlertViewDelegate,UITextFieldDelegate>


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
@property (weak, nonatomic) IBOutlet UIView *registerView;
@property (weak, nonatomic) IBOutlet UITextField *fullname;
@property (weak, nonatomic) IBOutlet UITextField *cellphone;
@property (weak, nonatomic) IBOutlet UITextField *profession;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLogin;
@property (weak, nonatomic) IBOutlet UIButton * registerMe;


@property (weak, nonatomic) IBOutlet UIButton * GoButton;

@end

@protocol LoginDelegate <NSObject>
- (void)conexionEstablecida;
@end