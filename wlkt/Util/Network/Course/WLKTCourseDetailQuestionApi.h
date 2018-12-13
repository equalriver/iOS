//
//  WLKTCourseDetailQuestionApi.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/8.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

@interface WLKTCourseDetailQuestionApi : YTKRequest
- (instancetype)initWithSuid:(NSString *)suid point_id:(NSString *)point_id course_id:(NSString *)course_id act_id:(NSString *)act_id question:(NSString *)question;

@end
