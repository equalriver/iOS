//
//  WLKTActiveRegisterApi.m
//  wlkt
//
//  Created by 尹平江 on 2017/7/25.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActiveRegisterApi.h"
#import "WLKTLogin.h"

@implementation WLKTActiveRegisterApi

- (NSString *)requestUrl {
    return @"user/actlist";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument{
    return @{
             @"app_userinfo" : TheCurUser.token
             };
}
@end
