//
//  MenuViewController.h
//  
//
//  Created by Riyad Anabtawi on 8/15/15.
//
//

#import <UIKit/UIKit.h>
@protocol MenuViewControllerDelegate <NSObject,UIScrollViewDelegate,UITextFieldDelegate>


-(void)didSelectMenuOption:(NSString *)option;
@end




@interface MenuViewController : UIViewController


@property (nonatomic,retain) IBOutlet UIImageView *user_image;
@property (nonatomic,retain) IBOutlet UILabel *user_name;
@property (nonatomic,retain) IBOutlet UILabel *menuTitle;
@property (nonatomic,retain) IBOutlet UILabel *topJobsLabel;
@property (nonatomic,retain) IBOutlet UILabel *homeLabel;
@property (nonatomic,retain) IBOutlet UILabel *lookforLabel;
@property (nonatomic,retain) IBOutlet UILabel *myProjectsLabel;
@property (nonatomic,retain) IBOutlet UILabel *searchLabel;
@property (nonatomic,retain) IBOutlet UILabel *signoutLabel;
@property (nonatomic,retain) IBOutlet UILabel *inviteFriendsLabel;

@property (nonatomic,retain) id<MenuViewControllerDelegate> delegate;

@property (nonatomic,retain) IBOutlet UIView *topJobsView;
@property (nonatomic,retain) IBOutlet UIView *homeView;
@property (nonatomic,retain) IBOutlet UIView *lookforView;
@property (nonatomic,retain) IBOutlet UIView *myProjectsView;
@property (nonatomic,retain) IBOutlet UIView *searchView;
@property (nonatomic,retain) IBOutlet UIView *signOutView;

@property (nonatomic,retain) IBOutlet UIView *inviteFriendsView;

@end
