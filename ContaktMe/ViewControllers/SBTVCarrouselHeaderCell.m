////
////  SBTVCarrouselHeaderCell.m
////  CDF
////
////  Created by SmartboxTV on 18-12-14.
////  Copyright (c) 2014 Smartbox TV. All rights reserved.
////
//
//#import "SBTVCarrouselHeaderCell.h"
//#import "SBTVNewsDetailViewController.h"
//#import "SBTVCarrouselViewCell.h"
//@implementation SBTVCarrouselHeaderCell{
//
//NSArray *_news;
//NSArray *_highlights;
//UINib *_headerNib;
//
//    CDFNewsData *_selectedNews;
//
//NSTimer *_carrouselTimer;
//}
//
//
//
//-(void)displayData{
//
// 
//    [self.carrouselCollectionView registerNib:[UINib nibWithNibName:@"CarrouselCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"carrouselCell"];
//    [self.activityIndicator startAnimating];
//    //Load Highlights
//    [SBTVServices loadNewsWithCategory:@5179 MaxCount:@5 AndHandler:^(id data) {
//        _highlights = data;
//        self.pageControl.numberOfPages = _highlights.count;
//        [self.carrouselCollectionView reloadData];
//
//        [_carrouselTimer invalidate];
//        _carrouselTimer = nil;
//
//        _carrouselTimer = [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(changeCarrouselPage) userInfo:nil repeats:YES];
//
//    } orErrorHandler:^(NSError *error) {
//
//    }];
//    //Load News
//    [SBTVServices loadNewsWithCategory:@3461 MaxCount:@100 AndHandler:^(id data) {
//
//        _news = data;
//              [self.activityIndicator stopAnimating];
//        self.activityIndicator.hidden = YES;
//
//    } orErrorHandler:^(NSError *error) {
//        [self.activityIndicator stopAnimating];
//        self.activityIndicator.hidden = YES;
//        //TODO
//    }];
//}
//
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"newsDetail"]) {
//        SBTVNewsDetailViewController *controller = (SBTVNewsDetailViewController *)segue.destinationViewController;
//        controller.newsData = _selectedNews;
//    }
//}
//
//- (void)changeCarrouselPage {
//
//    NSInteger newPage = self.pageControl.currentPage + 1;
//
//    if (newPage == _highlights.count) {
//        newPage = 0;
//    }
//
//    [self.carrouselCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:newPage inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
//}
//
////-(void)sbtvNuncheeCarrousel:(SBTVNuncheeCarrousel *)carrousel UserSelectItem:(id)item {
////    _selectedNews = item;
////    [self performSegueWithIdentifier:@"newsDetail" sender:self];
////}
//
//-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//    if (scrollView.tag == 100) {
//        [_carrouselTimer invalidate];
//        _carrouselTimer = nil;
//    }
//}
//
//-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
//    if (scrollView.tag == 100) {
//        [_carrouselTimer invalidate];
//        _carrouselTimer = nil;
//        _carrouselTimer = [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(changeCarrouselPage) userInfo:nil repeats:YES];
//    }
//}
//
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
//
//    if (scrollView.tag == 0) {
//        self.carrouselTopMarginConstraint.constant = scrollView.contentOffset.y * -0.8f;
//
//        CGFloat percent = MIN(abs(scrollView.contentOffset.y), 132) / 132.0f;
//        self.carrouselContainer.alpha = 1.0f - percent;
//    }
//    else {
//        self.pageControl.currentPage = (NSInteger)self.carrouselCollectionView.contentOffset.x / (NSInteger)self.carrouselCollectionView.frame.size.width;
//    }
//
//}
//
//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//
//
//        _selectedNews = [_highlights objectAtIndex:indexPath.row];
//
//    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
//       [self.delegate displayNewsPreviewWith:_selectedNews];
//    }
//}
//
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//
//        return [_highlights count];
//
//
//}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    SBTVCarrouselViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"carrouselCell" forIndexPath:indexPath];
//
//    [cell displayData:[_highlights objectAtIndex:indexPath.row]];
//
//    return cell;
//
//
//}
//
//
//-(UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}
//
//-(BOOL)shouldAutorotate {
//    return YES;
//}
//
//
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//
//
//
//            return CGSizeMake(657, 200);
//
//}
//
//
//@end
