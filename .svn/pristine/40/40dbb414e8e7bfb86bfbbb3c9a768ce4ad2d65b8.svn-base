//
//  WLKTCouponRuleApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/8/21.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCouponRuleApi.h"
#import "WLKTLogin.h"

@implementation WLKTCouponRuleApi
- (NSString *)requestUrl {
    return @"coupon/rule";
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
