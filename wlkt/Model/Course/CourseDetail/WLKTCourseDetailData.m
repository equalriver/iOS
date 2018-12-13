//
//  WLKTCourseDetailData.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/9/25.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCourseDetailData.h"

@implementation WLKTCourseDetailData
+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"course_activity": [WLKTCourseActivityData class],
             @"course_coupon": [WLKTCourseCouponData class],
             @"point": [WLKTAddress class],
             @"pricelist": [WLKTCoursePriceListData class],
             @"price_system": [WLKTCoursePriceSystemData class],
             @"param": [WLKTCourseDetailNew class]
             };
}

@end
