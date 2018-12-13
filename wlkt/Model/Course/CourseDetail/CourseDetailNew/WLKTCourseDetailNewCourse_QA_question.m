//
//  WLKTCourseDetailNewCourse_QA_question.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/9.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCourseDetailNewCourse_QA_question.h"

@implementation WLKTCourseDetailNewCourse_QA_question
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"qid" : @"id"
             };
}

+ (NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass {
    return @{
             @"answerlist": [WLKTCourseDetailNewCourse_QA_answer class]
             };
}

@end
