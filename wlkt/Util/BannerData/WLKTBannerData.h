//
//  WLKTBannerData.h
//  wlkt
//
//  Created by slovelys on 17/3/24.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "SDCycleScrollView.h"
@class WLKTCourse;

NS_ASSUME_NONNULL_BEGIN

@protocol WLKTBannerDataDelegate <NSObject>

@optional
// 首页
- (void)bannerView:(SDCycleScrollView *)bannerView didSelectCourseItem:(WLKTCourse *)course;

@end

@interface WLKTBannerData : NSObject

@property (weak, nonatomic) id <WLKTBannerDataDelegate> delegate;

- (instancetype)initWithBannerView:(SDCycleScrollView *)bannerView position:(WLKTBannerPosition)position;

- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
