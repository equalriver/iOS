//
//  WLKTCourseDetailAnswerApi.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/8.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

@interface WLKTCourseDetailAnswerApi : YTKRequest
- (instancetype)initWithQuestion_id:(NSString *)question_id answer:(NSString *)answer;

@end
