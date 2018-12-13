	//
//  WLKTCouponCenterApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/8/17.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCouponCenterApi.h"
#import "WLKTLogin.h"

@implementation WLKTCouponCenterApi
- (NSString *)requestUrl {
    return @"coupon/index";
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
