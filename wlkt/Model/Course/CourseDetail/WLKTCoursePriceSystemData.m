//
//  WLKTCoursePriceSystemData.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/9/25.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCoursePriceSystemData.h"


@implementation WLKTCoursePriceSystemData
+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"banxing": [WLKTCourseItemData class],
             @"shoufei": [WLKTCourseItemData class],
             @"biaozhun": [WLKTCourseItemData class]
             };
}

@end

