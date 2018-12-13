//
//  WLKTCourseDetailNew.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/6.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCourseDetailNew.h"

@implementation WLKTCourseDetailNew
+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"photo": [WLKTCourseDetailNewPhoto class],
             @"teacher": [WLKTCourseDetailNewTeacher class],
             @"about_list": [WLKTCourseDetailNewAbout_list class],
             @"hot_school": [WLKTCourseDetailNewHot_school class],
             @"vrlist": [WLKTSchoolVRList class]
             };
}
@end
