//
//  WLKTActivity.m
//  wlkt
//
//  Created by slovelys on 2017/7/18.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActivity.h"

#import <NSObject+YYModel.h>

@implementation WLKTActivity

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"aid" : @"id"
             };
}

//+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
//    return @{
//             @"info" : [NSString class]
//             };
//}

@end
