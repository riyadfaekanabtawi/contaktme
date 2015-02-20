//
//  SBTVCarrouselHeaderCell.h
//  CDF
//
//  Created by SmartboxTV on 18-12-14.
//  Copyright (c) 2014 Smartbox TV. All rights reserved.
//




#import <UIKit/UIKit.h>



@protocol SBTVCarrouselHeaderCellDelegate <NSObject>

-(void)displayNewsPreviewWith:(CDFNewsData *)news;

@end
@interface SBTVCarrouselHeaderCell : UICollectionViewCell <UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate,SBTVNuncheeCarrouselDelegate>
@property (nonatomic,retain) id<SBTVCarrouselHeaderCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIView *carrouselContainer;
@property (weak, nonatomic) IBOutlet UICollectionView *carrouselCollectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *titleColelctionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *carrouselTopMarginConstraint;
@property (weak, nonatomic) IBOutlet UIView *main;


-(void)displayData;

@end
