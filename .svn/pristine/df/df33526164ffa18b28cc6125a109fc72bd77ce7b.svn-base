//
//  WLKTLoginApi.m
//  wlkt
//
//  Created by slovelys on 17/3/20.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTLoginApi.h"

@interface WLKTLoginApi ()

@property (copy, nonatomic) NSString *username;
@property (copy, nonatomic) NSString *password;

@end

@implementation WLKTLoginApi

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password {
    WLKT_INIT(
              _username = username;
              _password = password;
    )
}

- (NSString *)requestUrl {
    return @"login/index";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"username" : _username,
             @"password" : _password,
             @"login_way" : [[UIDevice currentDevice] machineModelName]
             };
}

@end
