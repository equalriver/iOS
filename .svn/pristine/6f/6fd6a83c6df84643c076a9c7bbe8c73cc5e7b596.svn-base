//
//  WLKTRegisterApi.m
//  wlkt
//
//  Created by slovelys on 2017/4/24.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTRegisterApi.h"

@interface WLKTRegisterApi ()

@property (copy, nonatomic) NSString *username;
@property (copy, nonatomic) NSString *password;
@property (copy, nonatomic) NSString *authcode;

@end

@implementation WLKTRegisterApi

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password authcode:(NSString *)authcode {
    WLKT_INIT(
              _username = [username copy];
              _password = [password copy];
              _authcode = [authcode copy];
    )
}

- (NSString *)requestUrl {
    return @"reg/index";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"phone" : _username,
             @"password" : _password,
             @"token" : _authcode
             };
}

@end
