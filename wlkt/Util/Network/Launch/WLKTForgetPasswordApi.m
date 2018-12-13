//
//  WLKTForgetPasswordApi.m
//  wlkt
//
//  Created by slovelys on 2017/4/26.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTForgetPasswordApi.h"

@interface WLKTForgetPasswordApi ()

@property (copy, nonatomic) NSString *username;
@property (copy, nonatomic) NSString *password;
@property (copy, nonatomic) NSString *authcode;

@end

@implementation WLKTForgetPasswordApi

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password authcode:(NSString *)authcode {
    WLKT_INIT(
              _username = [username copy];
              _password = [password copy];
              _authcode = [authcode copy];
              )
}

- (NSString *)requestUrl {
    return @"reg/reset";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"phone" : _username,
             @"password" : _password
             };
}

@end
