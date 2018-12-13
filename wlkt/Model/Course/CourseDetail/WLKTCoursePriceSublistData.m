//
//  WLKTCoursePriceSublistData.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/9/26.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCoursePriceSublistData.h"

@implementation WLKTCoursePriceSublistData
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"iid" : @"id"
             };
}
+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"biaozhun": [WLKTCoursePriceSublist_2 class]
             };
}
@end
