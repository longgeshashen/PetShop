//
//  SuppliesBannerView.h
//  PetShop
//
//  Created by wjm on 15/6/23.
//  Copyright (c) 2015年 wjm. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SuppliesBannerViewDelegate<NSObject>
@optional
-(void)clickedBannerImage:(NSInteger)index;
@end
@interface SuppliesBannerView : UIView<UIScrollViewDelegate>
{
    //横向滚动视图
    IBOutlet UIScrollView *bannerScroll;
    //页视图
    IBOutlet UIPageControl *bannerPage;
}
@property(weak,nonatomic) id<SuppliesBannerViewDelegate> delegate;
/**
 加载scrollView上的图片
 */
-(void)loadScrollViewSubView:(NSArray*)dataArray;
@end
