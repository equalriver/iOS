//
//  WLKTActiveFreeApi.m
//  wlkt
//
//  Created by 尹平江 on 2017/7/24.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTActiveFreeApi.h"
#import "WLKTLogin.h"

@interface WLKTActiveFreeApi ()

@property (copy, nonatomic) NSString *hdid;
@property (copy, nonatomic) NSString *uname;
@property (copy, nonatomic) NSString *uphone;
@property (copy, nonatomic) NSString *renshu;

@end

@implementation WLKTActiveFreeApi
- (NSString *)requestUrl {
    return @"actpay/free";
}

- (instancetype)initWithHdid:(NSString *)hdid uname:(NSString *)uname uphone:(NSString *)uphone renshu:(NSString *)renshu
{
    self = [super init];
    if (self) {
        _hdid = hdid;
        _uname = uname;
        _uphone = uphone;
        _renshu = renshu;
    }
    return self;
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument{
    return @{
             @"hdid" : _hdid,
             @"uname" : _uname,
             @"uphone" : _uphone,
             @"renshu" : _renshu,
             @"app_userinfo" : TheCurUser.token
             };
}

@end
