//
//  WLKTCDGetCouponApi.h
//  wlkt
//
//  Created by nanbojiaoyu on 2018/4/12.
//  Copyright © 2018年 neimbo. All rights reserved.
//

#import "YTKRequest.h"

@interface WLKTCDGetCouponApi : YTKRequest
- (instancetype)initWithPingtaiCouponId:(NSString *)couponId;
- (instancetype)initWithSchoolCouponId:(NSString *)couponId;
@end
