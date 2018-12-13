//
//  WLKTGetCouponApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/8/17.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTGetCouponApi.h"
#import "WLKTLogin.h"

@interface WLKTGetCouponApi ()
@property (copy, nonatomic) NSString *mcid;

@end

@implementation WLKTGetCouponApi

- (instancetype)initWithMcid:(NSString *)mcid
{
    self = [super init];
    if (self) {
        _mcid = mcid;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"mycoupon/getcoupon";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id" : _mcid,
             @"app_userinfo" : TheCurUser.token ?: @""
             };
}
@end
