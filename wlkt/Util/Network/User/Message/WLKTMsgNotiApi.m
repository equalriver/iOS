//
//  WLKTMsgNotiApi.m
//  wlkt
//
//  Created by 尹平江 on 17/3/30.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTMsgNotiApi.h"
#import "WLKTLogin.h"

@implementation WLKTMsgNotiApi

- (NSString *)requestUrl {
    return @"message/index";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"app_userinfo" : TheCurUser.token
             };
}

@end
