//
//  WLKTActivityParamData.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/12/12.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActivityParamData.h"

@implementation WLKTActivityParamData
+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"hot_school": [WLKTActivityDetailSchoolList class],
             @"photo": [WLKTCourseDetailNewPhoto class],
             @"teacher": [WLKTCourseDetailNewTeacher class],
             @"vrlist": [WLKTSchoolVRList class]
             };
}
@end
