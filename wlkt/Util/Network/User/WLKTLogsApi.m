//
//  WLKTLogsApi.m
//  wlkt
//
//  Created by 尹平江 on 17/3/30.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTLogsApi.h"
#import "WLKTLogin.h"

@implementation WLKTLogsApi

- (NSString *)requestUrl {
    return @"user/logs";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"app_userinfo" : TheCurUser.token ? TheCurUser.token : @""
             };
}

@end
