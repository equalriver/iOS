//
//  WLKTCDOneprice.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/3/29.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDOneprice.h"

@implementation WLKTCDOneprice
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"pid" : @"id",

             };
}
+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"price_system": [WLKTCDDataPriceSystem class]
             };
}
@end