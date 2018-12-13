//
//  WLKTMyCouponDelApi.m
//  wlkt
//
//  Created by 尹平江 on 2017/8/15.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTMyCouponDelApi.h"
#import "WLKTLogin.h"

@interface WLKTMyCouponDelApi ()
@property (copy, nonatomic) NSArray *mcids;
@end

@implementation WLKTMyCouponDelApi

- (instancetype)initWithID:(__kindof NSArray *)mcids
{
    self = [super init];
    if (self) {
        _mcids = mcids;
    }
    return self;
}

- (NSString *)requestUrl {
    return [NSString stringWithFormat:@"mycoupon/del"];
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}
- (id)requestArgument{
    return @{
             @"ids" : _mcids
             };
}

@end
