//
//  WLKTHomepage.m
//  wlkt
//
//  Created by slovelys on 17/3/27.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTHomepage.h"
#import "WLKTActivity.h"

@implementation WLKTHomepage

+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"banner" : [WLKTCourse class],
             @"bannerlist" : [WLKTCourse class],
             @"hotlist" : [WLKTCourse class],
             @"school" : [WLKTCourse class],
             @"arts" : [WLKTCourse class],
             @"language" : [WLKTCourse class],
             @"like" : [WLKTCourse class],
             @"hotsearch" : [WLKTCourse class],
             @"topinfo" : [WLKTHeaderButtons class],
             @"actlist" : [WLKTActivity class],
             @"newslist": [WLKTNewsNormalNewsList class],
             @"yhlist": [WLKTCourse class],
             @"newcourselist": [WLKTCourse class],
             @"xq": [WLKTHomepageInterestItem class],
             @"vrlist": [WLKTSchoolVRList class]
             };
}

@end
