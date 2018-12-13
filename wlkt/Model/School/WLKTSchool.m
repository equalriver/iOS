//
//  WLKTSchool.m
//  wlkt
//
//  Created by slovelys on 17/4/14.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTSchool.h"

@implementation WLKTSchool

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
              @"schpoint": [WLKTAddress class],
              @"newslist": [WLKTSchoolNewsList class],
              @"actlist": [WLKTActivity class],
              @"photolist": [WLKTSchoolPhotoList class],
              @"starstulist": [WLKTSchoolStudentList class],
              @"courselist": [WLKTCourseDetailNewAbout_list class],
              @"videolist": [WLKTSchoolVideoList class],
              @"teachlist": [WLKTCourseDetailNewTeacher class],
              @"vrlist": [WLKTSchoolVRList class]
             };
}

@end
