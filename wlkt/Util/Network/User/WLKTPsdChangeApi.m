//
//  WLKTPsdChangeApi.m
//  wlkt
//
//  Created by 尹平江 on 17/3/30.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTPsdChangeApi.h"
#import "WLKTLogin.h"

@interface WLKTPsdChangeApi ()
@property (copy, nonatomic) NSString *OldPsd;
@property (copy, nonatomic) NSString *OtherPsd;
@end

@implementation WLKTPsdChangeApi

- (instancetype)initWithOldPassword:(NSString *)OldPassword otherPassword:(NSString *)otherPassword{
    self = [super init];
    if (self) {
        _OldPsd = OldPassword;
        _OtherPsd = otherPassword;
    }
    return self;
}
- (NSString *)requestUrl {
    return @"user/changepwd";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"oldpassword" : _OldPsd,
             @"newpassword" : _OtherPsd,
             @"app_userinfo" : TheCurUser.token
             };
}

@end
