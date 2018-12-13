//
//  WLKTSchoolVideoList.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/30.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchoolVideoList.h"

@implementation WLKTSchoolVideoList
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{
             @"vid" : @"id",
             @"title": @"description"
             };
    
}
@end
