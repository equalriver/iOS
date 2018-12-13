//
//  WLKTCDGetCouponApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2018/4/12.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "WLKTCDGetCouponApi.h"

@interface WLKTCDGetCouponApi ()
@property (copy, nonatomic) NSString *couponId;
@property (assign, nonatomic) BOOL isSchool;
@end

@implementation WLKTCDGetCouponApi

- (instancetype)initWithPingtaiCouponId:(NSString *)couponId
{
    self = [super init];
    if (self) {
        _couponId = couponId;
    }
    return self;
}

- (instancetype)initWithSchoolCouponId:(NSString *)couponId
{
    self = [super init];
    if (self) {
        _isSchool = YES;
        _couponId = couponId;
    }
    return self;
}

- (NSString *)requestUrl {
    if (self.isSchool) {
        return @"mycoupon/getschcoupon";
    }
    return @"mycoupon/getcoupon";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id" : _couponId
             };
}
@end
