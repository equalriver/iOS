//
//  WLKTCourseClassApi.m
//  wlkt
//
//  Created by 尹平江 on 2017/8/1.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCourseClassApi.h"
#import "WLKTLogin.h"

@implementation WLKTCourseClassApi

- (NSString *)requestUrl {
    return @"classify/course";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGet;
}

//- (id)requestArgument {
//    return @{
//             @"app_userinfo" : TheCurUser.token
//             };
//}

@end
