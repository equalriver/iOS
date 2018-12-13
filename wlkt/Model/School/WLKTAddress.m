//
//  WLKTAddress.m
//  wlkt
//
//  Created by slovelys on 17/4/6.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTAddress.h"

@implementation WLKTAddress
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{
             @"aid" : @"id"
             };
}
@end
