//
//  WLKTCourseDetailQuestionApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/8.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCourseDetailQuestionApi.h"
#import "WLKTLogin.h"

@interface WLKTCourseDetailQuestionApi ()
@property (copy, nonatomic) NSString *suid;
@property (copy, nonatomic) NSString *point_id;
@property (copy, nonatomic) NSString *course_id;
@property (copy, nonatomic) NSString *act_id;
@property (copy, nonatomic) NSString *question;
@end

@implementation WLKTCourseDetailQuestionApi
- (instancetype)initWithSuid:(NSString *)suid point_id:(NSString *)point_id course_id:(NSString *)course_id act_id:(NSString *)act_id question:(NSString *)question
{
    self = [super init];
    if (self) {
        _suid = suid;
        _point_id = point_id;
        _course_id = course_id;
        _act_id = act_id;
        _question = question;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"ques/sdata";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"user_id": TheCurUser.token ? TheCurUser.token : @"",
             @"suid": _suid,
             @"point_id": _point_id,
             @"course_id": _course_id,
             @"act_id": _act_id,
             @"question": _question
             };
}
//User_id    用户id
//Suid    学校id
//Point_id    校区id
//Course_id    课程id(如果没有值,传0)
//Act_id    活动id(如果没有值,传0)
//Question    提问的内容
@end
