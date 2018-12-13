//
//  WLKTCourseDetailAnswerApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/8.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCourseDetailAnswerApi.h"
#import "WLKTLogin.h"

@interface WLKTCourseDetailAnswerApi ()
@property (copy, nonatomic) NSString *question_id;
@property (copy, nonatomic) NSString *answer;
@end

@implementation WLKTCourseDetailAnswerApi
- (instancetype)initWithQuestion_id:(NSString *)question_id answer:(NSString *)answer
{
    self = [super init];
    if (self) {
        _question_id = question_id;
        _answer = answer;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"ques/replyques";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"user_id": TheCurUser.token ? TheCurUser.token : @"",
             @"question_id": _question_id,
             @"answer": _answer
             };
}
//User_id    用户id
//Question_id    问题id
//Answer    回答的内容
@end
