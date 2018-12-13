//
//  WLKTCourseDetailGetCouponApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/9/22.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTCourseDetailGetCouponApi.h"

@interface WLKTCourseDetailGetCouponApi ()
@property (copy, nonatomic) NSString *cid;
@end

@implementation WLKTCourseDetailGetCouponApi
- (instancetype)initWithCouponId:(NSString *)cid
{
    self = [super init];
    if (self) {
        _cid = cid;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"mycoupon/getschcoupon";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id" : _cid
             };
}
@end


