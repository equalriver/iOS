//
//  WLKTJoinSchoolClassifyData.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/11.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTJoinSchoolClassifyData.h"

@implementation WLKTJoinSchoolClassifyData
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{
             @"cid" : @"id"
             };
}
@end
