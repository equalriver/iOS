//
//  WLKTUserinfoChangeApi.m
//  wlkt
//
//  Created by 尹平江 on 17/3/28.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTUserinfoChangeApi.h"
#import "WLKTLogin.h"

@interface WLKTUserinfoChangeApi ()
@property (copy, nonatomic)NSString *username;
@property (copy, nonatomic)NSString *sex;
@property (copy, nonatomic)NSString *phone;
@property (copy, nonatomic)NSString *hobby;

@end

@implementation WLKTUserinfoChangeApi

- (instancetype)initWithUsername:(NSString *)username sex:(NSString *)sex phone:(NSString *)phone hobby:(NSString *)hobby
{
    self = [super init];
    if (self) {
        _username = username;
        _sex = sex;
        _phone = phone;
        _hobby = hobby;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"user/setinfo";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"username" : _username ? _username : @"无",
             @"sex" : _sex ? _sex : @"无",
             @"phone" : _phone ? _phone : @"无",
             @"hobby" : _hobby ? _hobby : @"",
             @"app_userinfo" : TheCurUser.token
             };
}

@end
