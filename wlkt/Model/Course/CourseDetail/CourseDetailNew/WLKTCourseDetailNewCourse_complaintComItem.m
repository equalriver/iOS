//
//  WLKTCourseDetailNewCourse_complaintComItem.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/9.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCourseDetailNewCourse_complaintComItem.h"

@implementation WLKTCourseDetailNewCourse_complaintComItem
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"complaint_id" : @"id"
             };
}
+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"handlelist": [WLKTCourseDetailNewCourse_complaintReplyItem class]
             };
}

@end
