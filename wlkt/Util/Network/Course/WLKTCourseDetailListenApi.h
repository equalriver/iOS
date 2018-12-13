//
//  WLKTCourseDetailListenApi.h
//  wlkt
//
//  Created by nanbojiaoyu on 2017/11/8.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

@interface WLKTCourseDetailListenApi : YTKRequest
- (instancetype)initWithSchoolId:(NSString *)suid phone:(NSString *)phone content:(NSString *)content courseId:(NSString *)courseId;

@end
