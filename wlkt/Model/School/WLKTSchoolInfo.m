//
//  WLKTSchoolInfo.m
//  wlkt
//
//  Created by slovelys on 17/4/14.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolInfo.h"

@implementation WLKTSchoolInfo
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"papers" : [WLKTSchoolInfoPapers class]
             };
}
@end
