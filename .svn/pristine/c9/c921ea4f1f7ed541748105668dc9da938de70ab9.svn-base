//
//  WLKTCourseDetailCouponAlert.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/8/23.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLKTCourseDetailData.h"

@protocol WLKTCourseDetailCouponAlertDelegate<NSObject>
@optional
- (void)courseDetailCouponSelected:(WLKTCourseCouponData *)data couponIndex:(NSInteger)couponIndex complete:(void(^)(void))complete;

@end

@interface WLKTCourseDetailCouponAlert : UIView
- (instancetype)initWithData:(NSArray<WLKTCourseCouponData *> *)dataArray isGetCoupon:(BOOL)isGetCoupon couponIndex:(NSInteger)couponIndex Target:(UIViewController *)vc;
@property (weak, nonatomic) id<WLKTCourseDetailCouponAlertDelegate> delegate;

@end

