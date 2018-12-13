//
//  WLKTClassroomList.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/2/1.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTClassroomList.h"

@implementation WLKTClassroomList
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{
             @"cid" : @"id"
             };
}
@end
