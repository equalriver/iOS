//
//  WLKTRePay.m
//  wlkt
//
//  Created by nanbojiaoyu on 2017/9/29.
//  Copyright © 2017年 neimbo. All rights reserved.
//

#import "WLKTRePay.h"

@interface WLKTRePay ()
@property (copy, nonatomic) NSString *oid;
@property (copy, nonatomic) NSString *paytype;
@end

@implementation WLKTRePay
- (instancetype)initWithOrderId:(NSString *)oid paytype:(NSString *)paytype
{
    self = [super init];
    if (self) {
        _oid = oid;
        _paytype = paytype;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"paynew/repay";
}
//paynew/repay/id/订单id/paytype/支付方式(alipay/tianfupay)
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (id)requestArgument {
    return @{
             @"id": _oid,
             @"paytype": _paytype
             };
}
@end
