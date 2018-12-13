//
//  WLKTLoginOutApi.m
//  wlkt
//
//  Created by 尹平江 on 17/3/31.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTLoginOutApi.h"
#import "WLKTLogin.h"

@implementation WLKTLoginOutApi

- (NSString *)requestUrl {
    return @"login/loginout";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"app_userinfo" : TheCurUser.token ?: @""
             };
}

@end
