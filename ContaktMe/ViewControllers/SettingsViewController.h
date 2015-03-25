//
//  HomeViewController.h
//  BeepGoosh
//
//  Created by Riyad Anabtawi on 1/11/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SBTVProgramPreview.h"
#import "IncidenciasEncuentro.h"
#import "ShareContactViewController.h"
#import "SWRevealViewController.h"
#import "User.h"
@interface SettingsViewController : UIViewController<SWRevealViewControllerDelegate,UIScrollViewDelegate,ShareContactDelegate,IncidenciaDelegate,IncidenciasEncuentroDelegate,SBTVProgramPreviewDelegate>
    

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ScreenWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mainScreenBottom;
@property IncidenciasEncuentro *incidenciasEncuentro;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrolltop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *draggableTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightDrag;
@property (nonatomic,retain) IBOutlet UIImageView *userImage;
@property (nonatomic,retain) IBOutlet UIImageView *slideShareImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mainviewTop;
@property (nonatomic,retain) IBOutlet UIView *navContainer;
@property (nonatomic,retain) IBOutlet UIView *mainView;
@property (nonatomic,retain) IBOutlet UIView *alertIfUserRejected;
@property (nonatomic,retain) IBOutlet UIScrollView *pullScrollView;
@property (nonatomic,retain) IBOutlet UIView *draggableView;
@property (nonatomic,retain) IBOutlet UIView *openMessage;

@property (nonatomic,retain) IBOutlet UIView *tapView;
@property (nonatomic,retain) IBOutlet UILabel *userName;
@property  BOOL accepted;
@property NSMutableArray *incidencias;
@property NSMutableArray *incidencias2;
@property (nonatomic,retain) Partido *datosPartido;
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
@property (nonatomic,retain) IBOutlet UIView *workplaceView;
@property (nonatomic,retain) IBOutlet UILabel *followed_by;
@property (nonatomic,retain) IBOutlet UILabel *location;
@property (nonatomic,retain) IBOutlet UIView *blockUIview;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *slideMenuMargin;
@property (nonatomic,retain) IBOutlet UIView *SlideMenuContainer;
@property (nonatomic,retain) IBOutlet UIView *footer;
@property (nonatomic,retain) IBOutlet UIImageView *shareicon;
@property (nonatomic,retain) UISwipeGestureRecognizer *gesture;




@property (nonatomic,retain)  User *user;



@property (nonatomic,retain) IBOutlet UILabel *name;
@property (nonatomic,retain) IBOutlet UILabel *location_user;
@end
