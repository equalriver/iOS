//
//  WLKTMyCouponApi.m
//  wlkt
//
//  Created by 尹平江 on 2017/8/14.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTMyCouponApi.h"

@interface WLKTMyCouponApi ()
@property (assign, nonatomic) NSInteger status;
@end

@implementation WLKTMyCouponApi

- (instancetype)initWithStatus:(NSInteger)status
{
    self = [super init];
    if (self) {
        _status = status;
    }
    return self;
}

- (NSString *)requestUrl {
    return [NSString stringWithFormat:@"mycoupon/couponlist/cstatus"];
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}
- (id)requestArgument{
    return @{
             @"cstatus" : @(_status),
             };
}

@end
