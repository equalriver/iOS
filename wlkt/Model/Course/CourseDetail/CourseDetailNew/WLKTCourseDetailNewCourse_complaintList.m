//
//  WLKTCourseDetailNewCourse_complaintList.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/10.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCourseDetailNewCourse_complaintList.h"

@implementation WLKTCourseDetailNewCourse_complaintList
+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"question_item": [WLKTCourseDetailNewCourse_complaintComItem class]
             };
}
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"question_item" : @"question"
             };
}
@end
