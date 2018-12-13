//
//  WLKTOrderGetCouponAndSaleApi.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/9/27.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTOrderGetCouponAndSaleApi.h"

@interface WLKTOrderGetCouponAndSaleApi ()
@property (copy, nonatomic) NSString *cid;
@property (copy, nonatomic) NSString *pointId;

@end

@implementation WLKTOrderGetCouponAndSaleApi
- (instancetype)initWithCourseId:(NSString *)cid addressId:(NSString *)aid
{
    self = [super init];
    if (self) {
        _cid = cid;
        _pointId = aid;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"order/course";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id": _cid,
             @"point": _pointId
             };
}
@end

